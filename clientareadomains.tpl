{if $warnings}
    {include file="$template/includes/alert.tpl" type="warning" msg=$warnings textcenter=true}
{/if}
<div class="tab-content">
    <div class="tab-pane fade show active" id="tabOverview">
        {include file="$template/includes/tablelist.tpl" tableName="DomainsList" noSortColumns="0, 1" startOrderCol="2" filterColumn="5"}
        <script>
            jQuery(document).ready(function () {
                var table = jQuery('#tableDomainsList').show().DataTable();

                {if $orderby == 'domain'}
                    table.order(2, '{$sort}');
                {elseif $orderby == 'regdate' || $orderby == 'registrationdate'}
                    table.order(3, '{$sort}');
                {elseif $orderby == 'nextduedate'}
                    table.order(4, '{$sort}');
                {elseif $orderby == 'autorenew'}
                    table.order(5, '{$sort}');
                {elseif $orderby == 'status'}
                    table.order(6, '{$sort}');
                {/if}
                table.draw();
                jQuery('#tableLoading').hide();
            });
        </script>
        <form id="domainForm" method="post" action="clientarea.php?action=bulkdomain">
            <input id="bulkaction" name="update" type="hidden" />

            <div class="btn-group btn-group-sm mb-3" role="group">
                <button type="button" class="btn btn-default setBulkAction" id="nameservers">
                    <i class="fal fa-globe fa-fw"></i>
                    {lang key='domainmanagens'}
                </button>
                <button type="button" class="btn btn-default setBulkAction" id="contactinfo">
                    <i class="fal fa-user"></i>
                    {lang key='domaincontactinfoedit'}
                </button>
                {if $allowrenew}
                    <button type="button" class="btn btn-default setBulkAction" id="renewDomains">
                        <i class="fal fa-sync"></i>
                        {lang key='domainmassrenew'}
                    </button>
                {/if}
                <div class="btn-group btn-group-sm" role="group">
                    <button id="btnGroupDrop1" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      {lang key="more"}...
                    </button>
                    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                      <a class="dropdown-item setBulkAction" href="#" id="autorenew"><i class="fal fa-sync"></i>
                    {lang key='domainautorenewstatus'}</a>
                      <a class="dropdown-item setBulkAction" href="#" id="reglock"><i class="fal fa-lock"></i>
                    {lang key='domainreglockstatus'}</a>
                    </div>
                  </div>
            </div>

            <div class="table-container clearfix">
                <table id="tableDomainsList" class="table table-list w-hidden">
                    <thead>
                        <tr>
                            <th class="width-fixed-20"></th>
                            <th></th>
                            <th>{lang key='orderdomain'}</th>
                            <th>{lang key='clientareahostingregdate'}</th>
                            <th>{lang key='clientareahostingnextduedate'}</th>
                            <th>{lang key='domainstatus'}</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach $domains as $domain}
                        <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=domaindetails&amp;id={$domain.id}', false)">
                            <td>
                                <input type="checkbox" name="domids[]" class="domids stopEventBubble" value="{$domain.id}" />
                            </td>
                            <td class="text-center ssl-info" data-element-id="{$domain.id}" data-type="domain" data-domain="{$domain.domain}">
                                {if $domain.sslStatus}
                                    <img src="{$domain.sslStatus->getImagePath()}" width="25" data-toggle="tooltip" title="{$domain.sslStatus->getTooltipContent()}" class="{$domain.sslStatus->getClass()}" width="25">
                                {elseif !$domain.isActive}
                                    <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" width="25" data-toggle="tooltip" title="{lang key='sslState.sslInactiveDomain'}" width="25">
                                {/if}
                            </td>
                            <td>
                                <a href="http://{$domain.domain}" target="_blank">{$domain.domain}</a>
                                <br>
                                <small>
                                    {if $domain.autorenew}
                                        <i class="fas fa-fw fa-check text-success"></i>
                                        {lang key='domainsautorenew'}
                                    {else}
                                        <i class="fas fa-fw fa-times text-danger"></i>
                                        {lang key='domainsautorenew'}
                                    {/if}
                                </small>
                            </td>
                            <td><span class="w-hidden">{$domain.normalisedRegistrationDate}</span>{$domain.registrationdate}</td>
                            <td><span class="w-hidden">{$domain.normalisedNextDueDate}</span>{$domain.nextduedate}</td>
                            <td>
                                <span class="label status status-{$domain.statusClass}">{$domain.statustext}</span>
                                <span class="w-hidden">
                                    {if $domain.expiringSoon}<span>{lang key="domainsExpiringSoon"}</span>{/if}
                                </span>
                            </td>
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
                <div class="text-center" id="tableLoading">
                    <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
                </div>
            </div>
        </form>
    </div>
</div>
