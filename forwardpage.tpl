<div class="my-2">
    {include file="$template/includes/alert.tpl" type="info" msg=$message textcenter=true}
</div>

<div class="mb-5 d-flex flex-column justify-content-center align-items-center">

    <div class="progress w-25 my-4">
        <div class="progress-bar progress-bar-striped progress-bar-animated bg-color-blue w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
            <span class="sr-only">{lang key='loading'}</span>
        </div>
    </div>

    <div id="frmPayment">

        {$code}

        <form method="post" action="{if $invoiceid}viewinvoice.php?id={$invoiceid}{else}clientarea.php{/if}">
        </form>

    </div>

</div>

<script>
    setTimeout("autoSubmitFormByContainer('frmPayment')", 5000);
</script>
