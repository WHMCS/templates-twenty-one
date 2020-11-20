<h3 class="card-title">{lang key='kbsuggestions'}</h3>

<p>{lang key='kbsuggestionsexplanation'}</p>

<div class="kbarticles list-group mb-3">
    {foreach $kbarticles as $kbarticle}
        <div class="list-group-item kb-article-item">
            <a href="knowledgebase.php?action=displayarticle&id={$kbarticle.id}" target="_blank">
                <i class="fal fa-file-alt fa-fw text-black-50"></i>
                {$kbarticle.title}
                <small>{$kbarticle.article}...</small>
            </a>
        </div>
    {/foreach}
</div>
