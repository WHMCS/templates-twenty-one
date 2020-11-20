<div class="alert alert-{if $type eq "error"}danger{elseif $type}{$type}{else}info{/if}{if $textcenter} text-center{/if}{if $additionalClasses} {$additionalClasses}{/if}{if $hide} w-hidden{/if}"{if $idname} id="{$idname}"{/if}>
{if $errorshtml}
    <strong>{lang key='clientareaerrors'}</strong>
    <ul>
        {$errorshtml}
    </ul>
{else}
    {if $title}
        <h2>{$title}</h2>
    {/if}
    {$msg}
{/if}
</div>
