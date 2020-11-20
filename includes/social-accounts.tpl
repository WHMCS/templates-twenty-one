{foreach $socialAccounts as $account}
    <li class="list-inline-item">
        <a class="btn btn-icon mb-1" href="{$account->getUrl()}" target="_blank">
            <i class="{$account->getFontAwesomeIcon()}"></i>
        </a>
    </li>
{/foreach}
