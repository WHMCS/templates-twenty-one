{if $affiliatesystemenabled}

    <div class="card">
        <div class="card-body extra-padding">

            <h3>{lang key='affiliatesignuptitle'}</h3>
            <p class="lead">{lang key='affiliatesignupintro'}</p>

            <ul class="py-4">
                <li>{lang key='affiliatesignupinfo1'}</li>
                <li>{lang key='affiliatesignupinfo2'}</li>
                <li>{lang key='affiliatesignupinfo3'}</li>
            </ul>

            <br />

            <form method="post" action="affiliates.php">
                <input type="hidden" name="activate" value="true" />
                <p align="center">
                    <button type="submit" class="btn btn-success btn-lg px-5 py-2">
                        {lang key='affiliatesactivate'}
                    </button>
                </p>
            </form>
        </div>
    </div>

{else}
    {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='affiliatesdisabled'}" textcenter=true}
{/if}
