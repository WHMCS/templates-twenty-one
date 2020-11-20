<div class="card">
    <div class="card-body">
        <h3 class="card-title">{lang key='domaingeteppcode'}</h3>

        <p>{lang key='domaingeteppcodeexplanation'}</p>

        {if $error}
            {include file="$template/includes/alert.tpl" type="error" msg="<i class='fas fa-exclamation-triangle fa-fw'></i> {lang key='domaingeteppcodefailure'}"|cat:" $error"}
        {elseif $eppcode}
            {include file="$template/includes/alert.tpl" type="info" msg="<i class='fas fa-info-circle fa-fw'></i> {lang key='domaingeteppcodeis'}"|cat:" $eppcode"}
        {else}
            {include file="$template/includes/alert.tpl" type="success" msg="<i class='fas fa-check fa-fw'></i> {lang key='domaingeteppcodeemailconfirmation'}"}
        {/if}

    </div>
</div>
