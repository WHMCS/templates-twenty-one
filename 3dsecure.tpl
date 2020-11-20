{include file="$template/includes/alert.tpl" type="info" msg="{lang key='creditcard3dsecure'}" textcenter=true}

<div class="card">
    <div class="card-body text-center">
        <div id="frmThreeDAuth" class="w-hidden">
            {$code}
        </div>

        <iframe name="3dauth" height="500" scrolling="auto" src="about:blank" class="submit-3d p-3"></iframe>
    </div>
</div>

<script>
    jQuery("#frmThreeDAuth").find("form:first").attr('target', '3dauth');
    setTimeout("autoSubmitFormByContainer('frmThreeDAuth')", 1000);
</script>
