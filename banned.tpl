<div class="alert alert-danger">
    <strong>
        <i class="fas fa-gavel"></i>
        {lang key='bannedyourip'}
        {$ip}
        {lang key='bannedhasbeenbanned'}
    </strong>
    <ul>
        <li>
            {lang key='bannedbanreason'}:
            <strong>{$reason}</strong>
        </li>
        <li>
            {lang key='bannedbanexpires'}:
            {$expires}
        </li>
    </ul>
</div>
