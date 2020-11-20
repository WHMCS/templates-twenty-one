<div class="content-block standout-features standout">
    <div class="container">
        <div class="row text-center">
            {if $type == 'ev'}
                <div class="col-md-6 col-lg-4">
                    <h4>{lang key='store.ssl.shared.ev.visualVerification'}</h4>
                    <p>{lang key='store.ssl.shared.ev.visualVerificationDescription'}</p>
                </div>
            {elseif $type == 'ov'}
                <div class="col-md-6 col-lg-4">
                    <h4>{lang key='store.ssl.shared.ov.ov'}</h4>
                    <p>{lang key='store.ssl.shared.ov.ovDescription'}</p>
                </div>
            {else}
                <div class="col-md-6 col-lg-4">
                    <h4>{lang key='store.ssl.shared.delivery'}</h4>
                    <p>{lang key='store.ssl.shared.deliveryDescription'}</p>
                </div>
            {/if}
            <div class="col-md-6 col-lg-4">
                <h4>{lang key='store.ssl.shared.siteSeal'}</h4>
                <p>{lang key='store.ssl.shared.siteSealDescription'}</p>
            </div>
            {if $type == 'ev'}
                <div class="col-md-12 col-lg-4">
                    <h4>{lang key='store.ssl.shared.ev.warranty'}</h4>
                    <p>{lang key='store.ssl.shared.ev.warrantyDescription'}</p>
                </div>
            {elseif $type == 'ov'}
                <div class="col-md-12 col-lg-4">
                    <h4>{lang key='store.ssl.shared.ov.warranty'}</h4>
                    <p>{lang key='store.ssl.shared.ov.warrantyDescription'}</p>
                </div>
            {else}
                <div class="col-md-12 col-lg-4">
                    <h4>{lang key='store.ssl.shared.googleRanking'}</h4>
                    <p>{lang key='store.ssl.shared.googleRankingDescription'}</p>
                </div>
            {/if}
        </div>
    </div>
</div>

<div class="content-block features">
    <div class="container">
        <h3>{lang key='store.ssl.shared.features'}</h3>
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-lock"></i>
                    <h5>{lang key='store.ssl.shared.encryptData'}</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-credit-card"></i>
                    <h5>{lang key='store.ssl.shared.secureTransactions'}</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-trophy"></i>
                    <h5>{lang key='store.ssl.shared.legitimacy'}</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-certificate"></i>
                    <h5>{lang key='store.ssl.shared.fastestSsl'}</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-window-maximize"></i>
                    <h5>{lang key='store.ssl.shared.browserCompatability'}</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-search"></i>
                    <h5>{lang key='store.ssl.shared.seoRank'}</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="far fa-clock"></i>
                    {if $type == 'ev'}
                        <h5>{lang key='store.ssl.shared.ev.issuance'}</h5>
                    {elseif $type == 'ov'}
                        <h5>{lang key='store.ssl.shared.ov.issuance'}</h5>
                    {else}
                        <h5>{lang key='store.ssl.shared.issuance'}</h5>
                    {/if}
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-sync"></i>
                    <h5>{lang key='store.ssl.shared.freeReissues'}</h5>
                </div>
            </div>
        </div>
    </div>
</div>
