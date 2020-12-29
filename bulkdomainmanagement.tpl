<div class="card">
    <div class="card-body">

        <form method="post" action="{$smarty.server.PHP_SELF}?action=bulkdomain">
            <input type="hidden" name="update" value="{$update}">
            <input type="hidden" name="save" value="1">
            {foreach $domainids as $domainid}
                <input type="hidden" name="domids[]" value="{$domainid}" />
            {/foreach}

            {if $update eq "nameservers"}
                <h3 class="card-title">{lang key='changenameservers'}</h3>

                {if $save}
                    {if $errors}
                    <div class="alert alert-error">
                        <p class="bold">
                            {lang key='clientareaerrors'}
                        </p>
                        <ul>
                        {foreach $errors as $error}
                            <li>{$error}</li>
                        {/foreach}
                        </ul>
                    </div>
                    {else}
                    <div class="alert alert-success">
                        <p>
                            {lang key='changessavedsuccessfully'}
                        </p>
                    </div>
                    {/if}
                {/if}

                <p>
                    {lang key='domainbulkmanagementchangesaffect'}
                </p>

                <ul class="list-group mb-3">
                    {foreach $domains as $domain}
                        <li class="list-group-item">{$domain}</li>
                    {/foreach}
                </ul>

                <div class="form-check form-check-inline">
                    <input id="nsChoiceDefault" type="radio" class="form-check-input" name="nschoice" value="default" onclick="disableFields('domnsinputs',true)" checked />
                    <label for="nsChoiceDefault" class="full col-form-label form-check-label">
                        {lang key='nschoicedefault'}
                    </label>
                </div>

                <div class="form-check form-check-inline">
                    <input id="nsChoiceCustom" type="radio" class="form-check-input" name="nschoice" value="custom" onclick="disableFields('domnsinputs', '')" checked />
                    <label for="nsChoiceCustom" class="full col-form-label form-check-label">
                        {lang key='nschoicecustom'}
                    </label>
                </div>

                {for $num=1 to 5}
                    <div class="form-group row">
                        <label for="inputNs{$num}" class="col-sm-4 col-form-label">{lang key='clientareanameserver'} {$num}</label>
                        <div class="col-sm-7">
                            <input type="text" name="ns{$num}" class="form-control domnsinputs" id="inputNs{$num}" />
                        </div>
                    </div>
                {/for}

                <div class="row">
                    <div class="col-sm-8 offset-sm-4">
                        <button type="submit" class="btn btn-primary btn-large">
                            {lang key='changenameservers'}
                        </button>
                    </div>
                </div>

            {elseif $update eq "autorenew"}

                <h3 class="card-title">{lang key='domainautorenewstatus'}</h3>

                {if $save}
                    <div class="alert alert-success">
                        <p>
                            {lang key='changessavedsuccessfully'}
                        </p>
                    </div>
                {/if}

                <p>{lang key='domainautorenewinfo'}</p>
                <p>{lang key='domainautorenewrecommend'}</p>
                <p>{lang key='domainbulkmanagementchangeaffect'}</p>

                <ul class="list-group mb-3">
                    {foreach $domains as $domain}
                        <li class="list-group-item">{$domain}</li>
                    {/foreach}
                </ul>

                <button type="submit" name="enable" class="btn btn-success btn-large">
                    {lang key='domainsautorenewenable'}
                </button>
                <button type="submit" name="disable" class="btn btn-danger btn-large">
                    {lang key='domainsautorenewdisable'}
                </button>

            {elseif $update eq "reglock"}

                <h3 class="card-title">{lang key='domainreglockstatus'}</h3>

                {if $save}
                    {if $errors}
                    <div class="alert alert-error">
                        <p class="bold">
                            {lang key='clientareaerrors'}
                        </p>
                        <ul>
                            {foreach $errors as $error}
                            <li>{$error}</li>
                            {/foreach}
                        </ul>
                    </div>
                    {else}
                    <div class="alert alert-success">
                        <p>
                            {lang key='changessavedsuccessfully'}
                        </p>
                    </div>
                    {/if}
                {/if}

                <p>{lang key='domainreglockinfo'}</p>
                <p>{lang key='domainreglockrecommend'}</p>
                <p>{lang key='domainbulkmanagementchangeaffect'}</p>

                <ul class="list-group mb-3">
                    {foreach $domains as $domain}
                        <li class="list-group-item">{$domain}</li>
                    {/foreach}
                </ul>

                <button type="submit" name="enable" class="btn btn-success btn-large">
                    {lang key='domainreglockenable'}
                </button>
                <button type="submit" name="disable" class="btn btn-danger btn-large">
                    {lang key='domainreglockdisable'}
                </button>

            {elseif $update eq "contactinfo"}

                <h3 class="card-title">{lang key='domaincontactinfoedit'}</h3>

                {if $save}
                    {if $errors}
                        <div class="alert alert-error">
                            <p class="bold">
                                {lang key='clientareaerrors'}
                            </p>
                            <ul>
                                {foreach $errors as $error}
                                <li>{$error}</li>
                            {/foreach}
                            </ul>
                        </div>
                    {else}
                        <div class="alert alert-success">
                            <p>
                                {lang key='changessavedsuccessfully'}
                            </p>
                        </div>
                    {/if}
                {/if}

                <p>{lang key='domainbulkmanagementchangesaffect'}</p>

                <ul class="list-group mb-3">
                    {foreach $domains as $domain}
                        <li class="list-group-item">{$domain}</li>
                    {/foreach}
                </ul>

                <ul class="nav nav-tabs responsive-tabs-sm" role="tablist">
                    {foreach $contactdetails as $contactdetail => $values}
                        <li class="nav-item">
                            <a class="nav-link{if $values@first} active{/if}" id="tabSelector{$contactdetail}" data-toggle="tab" href="#tab{$contactdetail}" role="tab">{$contactdetail}</a>
                        </li>
                    {/foreach}
                </ul>
                <div class="responsive-tabs-sm-connector"><div class="channel"></div><div class="bottom-border"></div></div>
                <div class="tab-content p-4">
                    {foreach $contactdetails as $contactdetail => $values}
                        <div class="tab-pane fade{if $values@first} show active{/if}" id="tab{$contactdetail}" role="tabpanel">

                            <div class="form-check">
                                <label>
                                    <input type="radio" class="form-check-input" name="wc[{$contactdetail}]" id="{$contactdetail}1" value="contact" onclick="useDefaultWhois(this.id)" />
                                    {lang key='domaincontactusexisting'}
                                </label>
                            </div>

                            <div class="row">
                                <div class="offset-1 col-10">
                                    <div class="form-group">
                                        <label for="{$contactdetail}3">{lang key='domaincontactchoose'}</label>
                                        <input type="hidden" name="sel[{$contactdetail}]" value="">
                                        <select id="{$contactdetail}3" class="form-control custom-select {$contactdetail}defaultwhois" name="sel[{$contactdetail}]" disabled>
                                            <option value="u{$clientsdetails.userid}">{lang key='domaincontactprimary'}</option>
                                            {foreach $contacts as $contact}
                                                <option value="c{$contact.id}">{$contact.name}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-check">
                                <label>
                                    <input type="radio" class="form-check-input" name="wc[{$contactdetail}]" id="{$contactdetail}2" value="custom" onclick="useCustomWhois(this.id)" checked />
                                    {lang key='domaincontactusecustom'}
                                </label>
                            </div>

                            {foreach $values as $name => $value}
                                <div class="form-group">
                                    <label>{$name}</label>
                                    <input type="text" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" data-original-value="{$value}" class="form-control {$contactdetail}customwhois{if array_key_exists($contactdetail, $irtpFields) && in_array($name, $irtpFields[$contactdetail])} irtp-field{/if}" />
                                </div>
                            {/foreach}
                        </div>
                    {/foreach}
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">
                        {lang key='clientareasavechanges'}
                    </button>
                </div>

            {/if}

        </form>

    </div>
</div>

<a href="clientarea.php?action=domains" class="btn btn-default">
    {lang key='clientareabacklink'}
</a>

<script type="text/javascript">
    var disableInternalTabSelection = true;
</script>
