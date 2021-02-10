{if $kbarticle.voted}
    {include file="$template/includes/alert.tpl" type="success alert-bordered-left" msg="{lang key="knowledgebaseArticleRatingThanks"}" textcenter=true}
{/if}

<div class="card">
    <div class="card-body">
        <h1>
            {$kbarticle.title}
            <a href="#" class="btn btn-default btn-sm float-right" onclick="window.print();return false">
                <i class="fas fa-print"></i>
                {lang key='print'}
            </a>
        </h1>

        <ul class="list-inline">
            {if $kbarticle.tags}
                <li class="list-inline-item pr-3">
                    <span class="badge badge-pill badge-info">
                        <i class="fas fa-code mr-1"></i>
                        {$kbarticle.tags}
                    </span>
                </li>
            {/if}
            <li class="list-inline-item text-sm pr-3 text-muted"><i class="fas fa-thumbs-up mr-2"></i>{$kbarticle.useful}</li>
        </ul>

        <hr>

        <article>
            {$kbarticle.text}
        </article>

        {if !$kbarticle.voted}
            <hr>
            <h4>{lang key='knowledgebasehelpful'}</h4>
            <form action="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" method="post" class="d-flex justify-content-between">
                <input type="hidden" name="useful" value="vote">
                <div>
                    <button class="btn btn-sm btn-secondary px-4" type="submit" name="vote" value="yes">
                        <i class="fas fa-thumbs-up"></i>
                        {lang key='knowledgebaseyes'}
                    </button>
                    <button class="btn btn-sm btn-secondary px-4" type="submit" name="vote" value="no">
                        <i class="fas fa-thumbs-down"></i>
                        {lang key='knowledgebaseno'}
                    </button>
                </div>
            </form>
        {/if}

    </div>
</div>

{if $kbarticles}
    <div class="card">
        <div class="card-body">
            <h3 class="card-title m-0">
                <i class="fal fa-folder-open fa-fw"></i>
                {lang key='knowledgebaserelated'}
            </h3>
        </div>
        <div class="list-group list-group-flush">
            {foreach $kbarticles as $kbarticle}
                <a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" class="list-group-item kb-article-item" data-id="{$kbarticle.id}">
                    <i class="fal fa-file-alt fa-fw text-black-50"></i>
                    {$kbarticle.title}
                    {if $kbarticle.editLink}
                        <button class="btn btn-sm btn-default show-on-card-hover" id="btnEditArticle-{$kbarticle.id}" data-url="{$kbarticle.editLink}" type="button">
                            {lang key="edit"}
                        </button>
                    {/if}
                    <small>{$kbarticle.article|truncate:100:"..."}</small>
                </a>
            {foreachelse}
                <div class="list-group-item">
                    {lang key='knowledgebasenoarticles'}
                </div>
            {/foreach}
        </div>
    </div>
{/if}

<a href="javascript:history.go(-1)" class="btn btn-default px-4">
    {lang key='clientareabacklink'}
</a>

{if $kbarticle.editLink}
    <a href="{$kbarticle.editLink}" class="btn btn-default px-4 float-right">
        <i class="fas fa-pencil-alt fa-fw"></i>
        {lang key='edit'}
    </a>
{/if}
