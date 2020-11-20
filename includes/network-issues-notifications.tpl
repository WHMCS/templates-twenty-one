{if $openNetworkIssueCounts.open > 0}
    <div class="alert alert-warning network-issue-alert m-0">
        <div class="container">
            <i class="fas fa-exclamation-triangle fa-fw"></i>
            We are aware of a potentially service impacting issue.
            <a href="serverstatus.php" class="alert-link float-lg-right">
                Learn more
                <i class="far fa-arrow-right"></i>
            </a>
        </div>
    </div>
{elseif $openNetworkIssueCounts.scheduled > 0}
    <div class="alert alert-info network-issue-alert m-0">
        <div class="container">
            <i class="fas fa-info-circle fa-fw"></i>
            There are upcoming maintenance events which may impact our services.
            <a href="serverstatus.php" class="alert-link float-lg-right">
                Learn more
                <i class="far fa-arrow-right"></i>
            </a>
        </div>
    </div>
{/if}
