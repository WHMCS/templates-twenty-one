<link href="{assetPath file='store.css'}" rel="stylesheet">

<div class="landing-page bg-white ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.ev.title"}</h2>
            <h3>{lang key="store.ssl.ev.tagline"}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="ev"}

    <div class="content-block standout">
        <div class="container">

            <h3>{lang key="store.ssl.ev.descriptionTitle"}</h3>

            <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-multi.png" class="float-md-right ml-md-4 mb-4">

            {lang key="store.ssl.ev.descriptionContent"}

            <br>
            <h3>{lang key="store.ssl.useCases.title"}</h3>
            <div class="row ideal-for ev">
                <div class="col-sm-4">
                    <i class="fas fa-globe-americas"></i>
                    <h4>{lang key="store.ssl.useCases.criticalDomains"}</h4>
                </div>
                <div class="col-sm-4">
                    <i class="fas fa-shopping-cart"></i>
                    <h4>{lang key="store.ssl.useCases.ecommerce"}</h4>
                </div>
                <div class="col-sm-4">
                    <i class="fas fa-user-plus"></i>
                    <h4>{lang key="store.ssl.useCases.signupPages"}</h4>
                </div>
            </div>

        </div>
    </div>

    {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="ev"}

    <div class="content-block dashed-border standout">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-2">
                    <br>
                    <h4>{lang key="store.ssl.ev.orgInfo"}</h4>
                    <p>{lang key="store.ssl.ev.orgInfoDescription"}</p>
                </div>
                <div class="col-lg-6 col-md-7 order-1">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/cert-details-ev.png">
                </div>
            </div>
        </div>
    </div>

    {include file="$template/store/ssl/shared/features.tpl" type="ev"}

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>
