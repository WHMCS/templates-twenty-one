{include file="$template/includes/tablelist.tpl" tableName="BillingNotesList" filterColumn="4"}

<script>
    jQuery(document).ready(function() {
        var table = jQuery('#tableBillingNotesList').show().DataTable();

        {if $orderby == 'id'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'dateissued'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'total'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'notetype'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').hide();
    });
</script>

<div class="table-container clearfix">
    <table id="tableBillingNotesList" class="table table-list w-hidden">
        <thead>
            <tr>
                <th>{lang key='billingnotes.col.id'}</th>
                <th>{lang key='amount'}</th>
                <th>{lang key='date'}</th>
                <th>{lang key='status'}</th>
                <th>{lang key='type'}</th>
            </tr>
        </thead>
        <tbody>
            {foreach $billingnotes as $note}
                <tr onclick="clickableSafeRedirect(event, '{$note.viewUrl}', true)">
                    <td><a href="{$note.viewUrl}">{$note.id}</a></td>
                    <td>{$note.total}</td>
                    <td><span class="w-hidden">{$note.normalisedDateIssued}</span>{$note.dateIssued}</td>
                    <td><span>{$note.status}</span></td>
                    <td><span>{$note.noteType}</span></td>
                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
    </div>
</div>
