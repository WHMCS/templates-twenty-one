<div class="card mb-4">
    <div class="card-body extra-padding">

        <div class="mb-4">
            <h6 class="h3">{lang key='contactus'}</h6>
            <p class="text-muted mb-0">{lang key='readyforquestions'}</p>
        </div>

        {if $sent}
            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='contactsent'}" textcenter=true}
        {/if}

        {if $errormessage}
            {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
        {/if}

        {if !$sent}
            <form method="post" action="contact.php" role="form">
            <input type="hidden" name="action" value="send" />

                <div class="form-group row">
                    <label for="inputName" class="col-sm-3 col-form-label text-right font-">{lang key='supportticketsclientname'}</label>
                    <div class="col-sm-7">
                        <input type="text" name="name" value="{$name}" class="form-control" id="inputName" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-3 col-form-label text-right">{lang key='supportticketsclientemail'}</label>
                    <div class="col-sm-7">
                        <input type="email" name="email" value="{$email}" class="form-control" id="inputEmail" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputSubject" class="col-sm-3 col-form-label text-right">{lang key='supportticketsticketsubject'}</label>
                    <div class="col-sm-7">
                        <input type="text" name="subject" value="{$subject}" class="form-control" id="inputSubject" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputMessage" class="col-sm-3 col-form-label text-right">{lang key='contactmessage'}</label>
                    <div class="col-sm-9">
                        <textarea name="message" rows="7" class="form-control" id="inputMessage">{$message}</textarea>
                    </div>
                </div>

                {if $captcha}
                    <div class="text-center margin-bottom">
                        {include file="$template/includes/captcha.tpl"}
                    </div>
                {/if}

                <div class="text-center">
                    <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}">{lang key='contactsend'}</button>
                </div>
            </form>

        {/if}

    </div>
</div>
