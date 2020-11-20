{foreach $customfields as $customfield}
    <div class="form-group">
        <label for="customfield{$customfield.id}">{$customfield.name}</label>
        {$customfield.input}
        {if $customfield.description}
            <p class="form-text text-muted">{$customfield.description}</p>
        {/if}
    </div>
{/foreach}
