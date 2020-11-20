<div class="card">
    <div class="card-body">
        <h3 class="card-title">{lang key="announcementstitle"}</h3>

        <div class="announcements">
            {foreach $announcements as $announcement}
                <div class="announcement">
                    <h1>
                        <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">
                            {$announcement.title}
                        </a>
                        {if $announcement.editLink}
                            <a href="{$announcement.editLink}" class="btn btn-default btn-sm show-on-hover">
                                <i class="fas fa-pencil-alt fa-fw"></i>
                                {lang key='edit'}
                            </a>
                        {/if}
                    </h1>

                    <ul class="list-inline">
                        <li class="list-inline-item text-muted pr-3">
                            <i class="far fa-calendar-alt fa-fw"></i>
                            {$carbon->createFromTimestamp($announcement.timestamp)->format('jS F Y')}
                        </li>
                    </ul>

                    <article>
                        {if $announcement.text|strip_tags|strlen < 350}
                            {$announcement.text}
                        {else}
                            {$announcement.summary}
                        {/if}
                    </article>

                    <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="btn btn-default btn-sm">
                        Continue reading
                        <i class="far fa-arrow-right"></i>
                    </a>
                </div>
            {foreachelse}
                {include file="$template/includes/alert.tpl" type="info" msg="{lang key='noannouncements'}" textcenter=true}
            {/foreach}
        </div>

    </div>
</div>

{if $prevpage || $nextpage}
    <nav aria-label="Announcements navigation">
        <ul class="pagination">
            <li class="page-item{if !$prevpage} disabled{/if}"><a class="page-link" href="{routePath('announcement-index-paged', $prevpage, $view)}">{lang key='previouspage'}</a></li>
            <li class="page-item{if !$nextpage} disabled{/if}"><a class="page-link" href="{routePath('announcement-index-paged', $nextpage, $view)}">{lang key='nextpage'}</a></li>
        </ul>
    </nav>
{/if}

{if $announcementsFbRecommend}
    <script>
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/{lang key='locale'}/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
{/if}
