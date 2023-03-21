<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{lang key='clientareaemails'} - {$companyname}</title>

    {include file="$template/includes/head.tpl"}

</head>
<body id="popup-backdrop">
    <div class="card bg-default">
        <div class="card-header">
            <h2 class="popup-header-padding"><i class='far fa-envelope'>&nbsp;</i>{$subject}</h2>
            {if is_array($attachments) && count($attachments) > 0}
                <div class="popup-header-padding">
                    {foreach $attachments as $attachedFile}
                        <i class="fal fa-paperclip"></i> {$attachedFile}{if !$attachedFile@last}<br>{/if}
                    {/foreach}
                </div>
            {/if}
        </div>
        <div class="card-body">
            <iframe width="100%" height="380" frameborder="0" srcdoc="{$message|escape}"></iframe>
        </div>
        <div class="card-footer text-center">
            <button type="button" class="btn btn-primary" onclick="window.close()">
                {lang key='closewindow'}
            </button>
        </div>
    </div>
</body>
</html>
