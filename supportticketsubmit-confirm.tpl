<div class="card">
    <div class="card-body extra-padding">

        <h3 class="card-title">{lang key="createNewSupportRequest"}</h3>

        <div class="alert alert-success text-center">
            <strong>
                {lang key='supportticketsticketcreated'}
                <a id="ticket-number" href="viewticket.php?tid={$tid}&amp;c={$c}" class="alert-link">#{$tid}</a>
            </strong>
        </div>

        <div class="row">
            <div class="col-10 offset-1">
                <p>{lang key='supportticketsticketcreateddesc'}</p>
            </div>
        </div>

        <br />

        <p class="text-center">
            <a href="viewticket.php?tid={$tid}&amp;c={$c}" class="btn btn-default">
                {lang key='continue'}
                <i class="fas fa-arrow-circle-right"></i>
            </a>
        </p>

    </div>
</div>
