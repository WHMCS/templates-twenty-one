{if $opencount == 0}
    <div class="alert alert-success">
        <i class="fas fa-check fa-fw"></i>
        {"{lang key='networkstatusnone'}"|sprintf:"{lang key='networkissuesstatusopen'}"}
    </div>
{/if}

{if $scheduledcount > 0}
    <div class="alert alert-info">
        <i class="fas fa-exclamation-triangle fa-fw"></i>
        {lang key='networkIssues.scheduled' count=$scheduledcount}
        <a href="serverstatus.php?view=scheduled" class="alert-link">{lang key='learnmore'}...</a>
    </div>
{/if}

{if $servers}
    <div class="card">
        <div class="card-body">
            <h3>{lang key='serverstatustitle'}</h3>

            <p>{lang key='serverstatusheadingtext'}</p>

            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>{lang key='servername'}</th>
                            <th class="text-center">{lang key='networkIssues.http'}</th>
                            <th class="text-center">{lang key='networkIssues.ftp'}</th>
                            <th class="text-center">{lang key='networkIssues.pop3'}</th>
                            <th class="text-center">{lang key='serverstatusphpinfo'}</th>
                            <th class="text-center">{lang key='serverstatusserverload'}</th>
                            <th class="text-center">{lang key='serverstatusuptime'}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $servers as $num => $server}
                            <tr>
                                <td>{$server.name}</td>
                                <td class="text-center" id="port80_{$num}">
                                    <span class="fas fa-spinner fa-spin"></span>
                                </td>
                                <td class="text-center" id="port21_{$num}">
                                    <span class="fas fa-spinner fa-spin"></span>
                                </td>
                                <td class="text-center" id="port110_{$num}">
                                    <span class="fas fa-spinner fa-spin"></span>
                                </td>
                                <td class="text-center"><a href="{$server.phpinfourl}" target="_blank">{lang key='serverstatusphpinfo'}</a></td>
                                <td class="text-center" id="load{$num}">
                                    <span class="fas fa-spinner fa-spin"></span>
                                </td>
                                <td class="text-center" id="uptime{$num}">
                                    <span class="fas fa-spinner fa-spin"></span>
                                    <script>
                                    jQuery(document).ready(function() {
                                        checkPort({$num}, 80);
                                        checkPort({$num}, 21);
                                        checkPort({$num}, 110);
                                        getStats({$num});
                                    });
                                    </script>
                                </td>
                            </tr>
                        {foreachelse}
                            <tr>
                                <td colspan="7">{lang key='serverstatusnoservers'}</td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
{/if}

{foreach $issues as $issue}
    <div class="card">
        <div class="card-header">
            {$issue.title}
            ({$issue.status})
            <span id="issuePriorityLabel" class="badge badge-{if $issue.rawPriority == 'Critical'}danger{elseif $issue.rawPriority == 'High'}warning{elseif $issue.rawPriority == 'Low'}success{else}info{/if} float-md-right">{$issue.priority}</span>
        </div>
        <div class="card-body">
            {if $issue.server || $issue.affecting}
                <p class="h5">
                    <strong>{lang key='networkissuesaffecting'} {$issue.type}</strong>
                    -
                    {if $issue.type eq "{lang key='networkissuestypeserver'}"}
                        {$issue.server}
                    {else}
                        {$issue.affecting}
                    {/if}
                </p>
            {/if}
            <ul class="list-inline">
                <li class="list-inline-item pr-3">
                    <i class="far fa-calendar-alt fa-fw"></i>
                    {$issue.startdate}
                    {if $issue.enddate} - {$issue.enddate}{/if}
                </li>
                <li class="list-inline-item pr-3">
                    <i class="far fa-clock fa-fw"></i>
                    {lang key='networkissueslastupdated'}</strong> {$issue.lastupdate}
                </li>
            </ul>
            {if $issue.clientaffected}
                <div class="alert alert-warning p-1 text-center">
                    {lang key='networkIssues.affectingYou'}
                </div>
            {/if}
            <p>
                {$issue.description}
            </p>
        </div>
    </div>
{foreachelse}
    <p>{$noissuesmsg}</p>
{/foreach}

<nav aria-label="Network issues navigation">
    <ul class="pagination">
        <li class="page-item{if !$prevpage} disabled{/if}"><a class="page-link" href="?{if $view}view={$view}&amp;{/if}page={$prevpage}">{lang key='previouspage'}</a></li>
        <li class="page-item{if !$nextpage} disabled{/if}"><a class="page-link" href="?{if $view}view={$view}&amp;{/if}page={$nextpage}">{lang key='nextpage'}</a></li>
    </ul>
</nav>
