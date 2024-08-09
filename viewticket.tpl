{if $invalidTicketId}
    {include file="$template/includes/alert.tpl" type="danger" title="{lang key='thereisaproblem'}" msg="{lang key='supportticketinvalid'}" textcenter=true}
{else}
    {if $closedticket}
        {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='supportticketclosedmsg'}" textcenter=true}
    {/if}

    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
{/if}

{if !$invalidTicketId}
    <div class="card view-ticket">
        <div class="card-body p-3">
            <h3 class="card-title">
                {lang key='supportticketsviewticket'} #{$tid}
                <div class="ticket-actions float-sm-right mt-3 mt-sm-0">
                    <button id="ticketReply" type="button" class="btn btn-default btn-sm" onclick="smoothScroll('#ticketReplyContainer')">
                        <i class="fas fa-pencil-alt fa-fw"></i>
                        {lang key='supportticketsreply'}
                    </button>
                    {if $showCloseButton}
                        {if $closedticket}
                            <button class="btn btn-danger btn-sm" disabled="disabled">
                                <i class="fas fa-times fa-fw"></i>
                                {lang key='supportticketsstatusclosed'}
                            </button>
                        {else}
                            <button class="btn btn-danger btn-sm" onclick="window.location='?tid={$tid}&amp;c={$c}&amp;closeticket=true'">
                                <i class="fas fa-times fa-fw"></i>
                                {lang key='supportticketsclose'}
                            </button>
                        {/if}
                    {/if}
                </div>
            </h3>

            <p>
                {lang key='supportticketssubject'}:
                <strong>{$subject}</strong>
            </p>
        </div>

        {foreach $descreplies as $reply}
            <div class="card-body">
                <div class="ticket-reply markdown-content{if $reply.admin} staff{/if}">
                    <div class="posted-by">
                        {lang key="support.postedBy" name="<span class=\"posted-by-name\">{$reply.requestor.name}</span>" date="<span class=\"posted-on\">{$reply.date}</span>" requestorType="<span class=\"label requestor-badge requestor-type-{$reply.requestor.type_normalised} float-md-right\">{lang key='support.requestor.'|cat:$reply.requestor.type_normalised}</span>"}
                    </div>
                    <div class="message p-3">
                        {$reply.message}
                        {if $reply.ipaddress}
                            <hr>
                            {lang key='support.ipAddress'}: {$reply.ipaddress}
                        {/if}
                        {if $reply.id && $reply.admin && $ratingenabled}
                            <div class="clearfix">
                                {if $reply.rating}
                                    <div class="rating-done">
                                        {for $rating=1 to 5}
                                            <span class="star{if (5 - $reply.rating) < $rating} active{/if}"></span>
                                        {/for}
                                        <div class="rated">{lang key='ticketreatinggiven'}</div>
                                    </div>
                                {else}
                                    <div class="rating" ticketid="{$tid}" ticketkey="{$c}" ticketreplyid="{$reply.id}">
                                        <span class="star" rate="5"></span>
                                        <span class="star" rate="4"></span>
                                        <span class="star" rate="3"></span>
                                        <span class="star" rate="2"></span>
                                        <span class="star" rate="1"></span>
                                    </div>
                                {/if}
                            </div>
                        {/if}
                    </div>
                    {if $reply.attachments}
                        <div class="attachments p-3">
                            <strong>
                                <i class="far fa-paperclip fa-fw"></i>
                                {lang key='supportticketsticketattachments'} ({$reply.attachments|count})
                            </strong>
                            {if $reply.attachments_removed} - {lang key='support.attachmentsRemoved'}{/if}
                            <ul class="attachment-list">
                                {foreach $reply.attachments as $num => $attachment}
                                    <li>
                                        {if $reply.attachments_removed}
                                            <span>
                                                <figure>
                                                    <i class="far fa-file-minus"></i>
                                                </figure>
                                                <div class="caption">
                                                    {$attachment}
                                                </div>
                                            </span>
                                        {else}
                                            <a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}">
                                                <span>
                                                    <figure>
                                                        <i class="far fa-file"></i>
                                                    </figure>
                                                    <div class="caption">
                                                        {$attachment}
                                                    </div>
                                                </span>
                                            </a>
                                        {/if}
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                    {/if}
                </div>
            </div>
        {/foreach}
    </div>

    <div class="card d-print-none" id="ticketReplyContainer">
        <div class="card-body">
            <h3 class="card-title">{lang key='supportticketsreply'}</h3>

            <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data" role="form" id="frmReply">
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="inputName">{lang key='supportticketsclientname'}</label>
                        <input class="form-control" type="text" name="replyname" id="inputName" value="{$replyname}"{if $loggedin} disabled="disabled"{/if}>
                    </div>
                    <div class="form-group col-md-5">
                        <label for="inputEmail">{lang key='supportticketsclientemail'}</label>
                        <input class="form-control" type="text" name="replyemail" id="inputEmail" value="{$replyemail}"{if $loggedin} disabled="disabled"{/if}>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputMessage">{lang key='contactmessage'}</label>
                    <textarea name="replymessage" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="ctr{$tid}">{$replymessage}</textarea>
                </div>

                <div class="form-group">
                    <label for="inputAttachments">{lang key='supportticketsticketattachments'}</label>
                    <div class="input-group mb-1 attachment-group">
                        <div class="custom-file">
                            <label class="custom-file-label text-truncate" for="inputAttachment1" data-default="Choose file">
                                {lang key='chooseFile'}
                            </label>
                            <input type="file" class="custom-file-input" name="attachments[]" id="inputAttachment1">
                        </div>
                        <div class="input-group-append">
                            <button class="btn btn-default" type="button" id="btnTicketAttachmentsAdd">
                                <i class="fas fa-plus"></i>
                                {lang key='addmore'}
                            </button>
                        </div>
                    </div>
                    <div class="file-upload w-hidden">
                        <div class="input-group mb-1 attachment-group">
                            <div class="custom-file">
                                <label class="custom-file-label text-truncate">
                                    {lang key='chooseFile'}
                                </label>
                                <input type="file" class="custom-file-input" name="attachments[]">
                            </div>
                        </div>
                    </div>
                    <div id="fileUploadsContainer"></div>
                    <div class="text-muted">
                        <small>{lang key='supportticketsallowedextensions'}: {$allowedfiletypes} ({lang key="maxFileSize" fileSize="$uploadMaxFileSize"})</small>
                    </div>
                </div>

                <div class="form-group text-center">
                    <input class="btn btn-primary" type="submit" name="save" value="{lang key='supportticketsticketsubmit'}" />
                    <input class="btn btn-default" type="reset" value="{lang key='cancel'}" onclick="jQuery('#ticketReply').click()" />
                </div>
            </form>

        </div>
    </div>
{/if}
