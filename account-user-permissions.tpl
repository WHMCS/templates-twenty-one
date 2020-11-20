<div class="card">
    <div class="card-body">
        <h3 class="card-title">{lang key='userManagement.managePermissions'}</h3>

        <p>{$user->email}</p>

        <p class="h5">{lang key="userManagement.permissions"}</p>

        <form method="post" action="{routePath('account-users-permissions-save', $user->id)}">

            {foreach $permissions as $permission}
                <label class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" name="perms[{$permission.key}]" value="1"{if $userPermissions->hasPermission($permission.key)} checked{/if}>
                    {$permission.title}
                    <span class="d-none d-md-inline">-</span>
                    <br class="d-md-none">
                    <span class="text-muted">{$permission.description}</span>
                </label>
                <br>
            {/foreach}

            <br>

            <p>
                <button type="submit" class="btn btn-primary">
                    {lang key="clientareasavechanges"}
                </button>
                <a href="{routePath('account-users')}" class="btn btn-default">
                    {lang key="clientareacancel"}
                </a>
            </p>

        </form>

    </div>
</div>
