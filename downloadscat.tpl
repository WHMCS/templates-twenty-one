<form role="form" method="post" action="{routePath('download-search')}">
    <div class="input-group input-group-lg kb-search margin-bottom">
        <input type="text" name="search" id="inputDownloadsSearch" class="form-control font-weight-light" placeholder="{lang key='downloadssearch'}" value="{$search}" />
        <div class="input-group-append">
            <button type="submit" id="btnDownloadsSearch" class="btn btn-primary btn-input-padded-responsive">
                {lang key='search'}
            </button>
        </div>
    </div>
</form>

{if $dlcats}
    <div class="row">
        {foreach $dlcats as $category}
            <div class="col-xl-6">
                <div class="card kb-category mb-4">
                    <a href="{routePath('download-by-cat', {$category.id}, {$category.urlfriendlyname})}" class="card-body">
                        <span class="h5 m-0">
                            <i class="fal fa-folder fa-fw"></i>
                            {$category.name}
                            <span class="badge badge-info float-right">
                                {lang key="downloads.numDownload{if $kbcat.numarticles != 1}s{/if}" num=$category.numarticles}
                            </span>
                        </span>
                        <p class="m-0 text-muted"><small>{$category.description}</small></p>
                    </a>
                </div>
            </div>
        {/foreach}
    </div>
{/if}

<div class="card">
    <div class="card-body">
        <h3 class="card-title m-0">
            <i class="fal fa-download fa-fw"></i>
            {lang key='downloadsfiles'}
        </h3>
    </div>
    <div class="list-group list-group-flush">
        {foreach $downloads as $download}
            <a href="{$download.link}" class="list-group-item kb-article-item">
                {$download.type|replace:'alt':' class="pr-1" alt'}
                {$download.title}
                {if $download.clientsonly}
                    <div class="float-md-right">
                        <span class="label label-danger">
                            <i class="fas fa-lock fa-fw"></i>
                            {lang key='restricted'}
                        </span>
                    </div>
                {/if}
                <small>
                    {$download.description}
                    <br>
                    <strong>{lang key='downloadsfilesize'}: {$download.filesize}</strong>
                </small>
            </a>
        {foreachelse}
            <div class="list-group-item">
                {lang key='downloadsnone'}
            </div>
        {/foreach}
    </div>
</div>

<a href="javascript:history.go(-1)" class="btn btn-default px-4">
    {lang key='clientareabacklink'}
</a>
