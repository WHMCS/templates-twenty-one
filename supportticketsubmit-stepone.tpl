<div class="card">
    <div class="card-body extra-padding">

        <div class="mb-4">
            <h3 class="card-title">{lang key="createNewSupportRequest"}</h3>
            <p class="text-muted mb-0">{lang key='supportticketsheader'}</p>
        </div>

        <div class="row">
            <div class="col-sm-10 offset-sm-1">
                {foreach $departments as $num => $department}
                    <p class="h5">
                        <a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}">
                            <i class="fas fa-envelope"></i>
                            &nbsp;{$department.name}
                        </a>
                    </p>
                    {if $department.description}
                        <p class="text-muted">{$department.description}</p>
                    {/if}
                {foreachelse}
                    {include file="$template/includes/alert.tpl" type="info" msg="{lang key='nosupportdepartments'}" textcenter=true}
                {/foreach}
            </div>
        </div>

    </div>
</div>
