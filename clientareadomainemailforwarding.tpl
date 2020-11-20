<div class="card">
    <div class="card-body">
        <h3 class="card-title">{lang key='domainemailforwarding'}</h3>

        {include file="$template/includes/alert.tpl" type="info" msg="{lang key='domainemailforwardingdesc'}"}

        {if $error}
            {include file="$template/includes/alert.tpl" type="error" msg=$error}
        {/if}

        {if $external}
            <div class="text-center px-4">
                {$code}
            </div>
        {else}

            <form method="post" action="{$smarty.server.PHP_SELF}?action=domainemailforwarding">
                <input type="hidden" name="sub" value="save" />
                <input type="hidden" name="domainid" value="{$domainid}" />

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>{lang key='domainemailforwardingprefix'}</th>
                            <th></th>
                            <th>{lang key='domainemailforwardingforwardto'}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $emailforwarders as $num => $emailforwarder}
                        <tr>
                            <td><input type="text" name="emailforwarderprefix[{$num}]" value="{$emailforwarder.prefix}" class="form-control" /></td>
                            <td class="text-center">@{$domain} => </td>
                            <td><input type="text" name="emailforwarderforwardto[{$num}]" value="{$emailforwarder.forwardto}" class="form-control" /></td>
                        </tr>
                        {/foreach}
                        <tr>
                            <td><input type="text" name="emailforwarderprefixnew" class="form-control" /></td>
                            <td class="text-center">@{$domain} => </td>
                            <td><input type="text" name="emailforwarderforwardtonew" class="form-control" /></td>
                        </tr>
                    </tbody>
                </table>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">
                        {lang key='clientareasavechanges'}
                    </button>
                    <button type="reset" class="btn btn-default">
                        {lang key='clientareacancel'}
                    </button>
                </div>

            </form>

        {/if}

    </div>
</div>
