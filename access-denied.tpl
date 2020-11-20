<div class="text-center">
    <div class="card py-3">
        <div class="card-body">
            <h1>{lang key='oops'}!</h1>
            <div class="pb-2">{lang key='subaccountpermissiondenied'}</div>
            {if !empty($allowedpermissions)}
                <div>{lang key='subaccountallowedperms'}</div>
                <div class="list-group list-group-flush">
                    {foreach $allowedpermissions as $permission}
                        <div class="list-group-item">{$permission}</div>
                    {/foreach}
                </div>
            {/if}
            <div>{lang key='subaccountcontactmaster'}</div>
        </div>
        <div class="buttons pt-2 pb-4">
            <a href="javascript:history.go(-1)" class="btn btn-primary">
                <i class="fas fa-arrow-circle-left"></i>
                {lang key='goback'}
            </a>
            <a href="index.php" class="btn btn-default">
                <i class="fas fa-home"></i>
                {lang key='returnhome'}
            </a>
        </div>
    </div>
</div>
