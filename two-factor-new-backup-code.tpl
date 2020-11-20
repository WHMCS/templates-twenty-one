<div class="card mw-540 mb-md-4 mt-md-4">
    <div class="card-body px-sm-5 py-5">

        <h3 class="card-title">{lang key='twofactorauth'}</h3>

        {include file="$template/includes/alert.tpl" type="success" msg="{lang key='twofabackupcodereset'}" textcenter=true}

        <h5 class="text-center">{lang key='twofanewbackupcodeis'}</h5>

        <div class="alert alert-warning text-center h4">
            {$newBackupCode}
        </div>

        <p class="text-center">{lang key='twofabackupcodeexpl'}</p>

        <p class="text-center">
            <a href="{routePath('clientarea-home')}" class="btn btn-default">
                {lang key='continue'} &raquo;
            </a>
        </p>

    </div>
</div>
