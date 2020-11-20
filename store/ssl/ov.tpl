<link href="{assetPath file='store.css'}" rel="stylesheet">

<div class="landing-page bg-white ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.ov.title"}</h2>
            <h3>{lang key="store.ssl.ov.tagline"}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="ov"}

    <div class="content-block standout">
        <div class="container">

            <h3>{lang key="store.ssl.ov.descriptionTitle"}</h3>

            <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-subs.png" class="float-md-right ml-md-4 mb-4">

            <div class="text-center d-block d-sm-none">
                <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-subs.png">
                <br><br>
            </div>

            {lang key="store.ssl.ov.descriptionContent"}

            <br>
            <h3>{lang key="store.ssl.useCases.title"}</h3>
            <div class="row ideal-for ov">
                <div class="col-sm-4">
                    <i class="fas fa-lock-alt"></i>
                    <h4>{lang key="store.ssl.useCases.loginPages"}</h4>
                </div>
                <div class="col-sm-4">
                    <i class="fas fa-project-diagram"></i>
                    <h4>{lang key="store.ssl.useCases.intranetSites"}</h4>
                </div>
                <div class="col-sm-4">
                    <i class="fas fa-inbox"></i>
                    <h4>{lang key="store.ssl.useCases.webmail"}</h4>
                </div>
            </div>

        </div>
    </div>

    {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="ov"}

    <div class="content-block dashed-border standout">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-2">
                    <br>
                    <h4>{lang key="store.ssl.ov.orgInfo"}</h4>
                    <p>{lang key="store.ssl.ov.orgInfoDescription"}</p>
                </div>
                <div class="col-lg-6 col-md-7 order-lg-1">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/cert-details-ov.png">
                </div>
            </div>
        </div>
    </div>

    {include file="$template/store/ssl/shared/features.tpl" type="ov"}

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>
