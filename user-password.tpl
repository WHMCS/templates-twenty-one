<div class="card">
    <div class="card-body">
        <h3 class="card-title">{lang key='sidebars.viewAccount.changePassword'}</h3>

        {include file="$template/includes/flashmessage.tpl"}

        <form class="using-password-strength" method="post" action="{routePath('user-password')}" role="form">
            <input type="hidden" name="submit" value="true" />
            <div class="form-group row">
                <label for="inputExistingPassword" class="col-xl-4 col-form-label">{lang key='existingpassword'}</label>
                <div class="col-xl-5">
                    <input type="password" class="form-control" name="existingpw" id="inputExistingPassword" autocomplete="off" />
                </div>
            </div>
            <div id="newPassword1" class="form-group has-feedback row">
                <label for="inputNewPassword1" class="col-xl-4 col-form-label">{lang key='newpassword'}</label>
                <div class="col-xl-5">
                    <input type="password" class="form-control" name="newpw" id="inputNewPassword1" autocomplete="off" />
                    {include file="$template/includes/pwstrength.tpl"}
                </div>
                <div class="col-xl-3">
                    <button type="button" class="btn btn-default btn-block generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                        {lang key='generatePassword.btnLabel'}
                    </button>
                </div>
            </div>
            <div id="newPassword2" class="form-group has-feedback row">
                <label for="inputNewPassword2" class="col-xl-4 col-form-label">{lang key='confirmnewpassword'}</label>
                <div class="col-xl-5">
                    <input type="password" class="form-control" name="confirmpw" id="inputNewPassword2" autocomplete="off" />
                    <div id="inputNewPassword2Msg"></div>
                </div>
            </div>
            <input class="btn btn-primary" type="submit" value="{lang key='clientareasavechanges'}" />
            <input class="btn btn-default" type="reset" value="{lang key='cancel'}" />
        </form>

    </div>
</div>
