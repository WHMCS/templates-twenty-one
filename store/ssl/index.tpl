<link href="{assetPath file='store.css'}" rel="stylesheet">

<div class="landing-page bg-white ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.landingPage.title"}</h2>
            <h3>{lang key="store.ssl.landingPage.tagline1"}<br>{lang key="store.ssl.landingPage.tagline2"}</h3>
        </div>
    </div>

    {if !empty($certificatesToDisplay['dv']) || !empty($certificatesToDisplay['ov']) || !empty($certificatesToDisplay['ev']) }
        <div class="validation-levels">
            <div class="container">
                <h3>{lang key="store.ssl.landingPage.chooseLevel"}</h3>
                <div class="row">
                    {if !empty($certificatesToDisplay['dv']) }
                        {include
                            file="$template/store/ssl/shared/certificate-item.tpl"
                            blockTitle="store.ssl.landingPage.rapidSSL.title"
                            recommendedFor="store.ssl.landingPage.rapidSSL.recommended"
                            certificate=$certificatesToDisplay['dv']['certificate']
                            features=$certificatesToDisplay['dv']['features']
                            description=$certificatesToDisplay['dv']['description']
                            logo=$certificateFeatures[$certificatesToDisplay['dv']['certificate']->configoption1]["logo"]
                        }
                    {/if}
                    {if !empty($certificatesToDisplay['ov']) }
                        {include
                            file="$template/store/ssl/shared/certificate-item.tpl"
                            blockTitle="store.ssl.landingPage.geoTrust.title"
                            recommendedFor="store.ssl.landingPage.geoTrust.recommended"
                            certificate=$certificatesToDisplay['ov']['certificate']
                            features=$certificatesToDisplay['ov']['features']
                            description=$certificatesToDisplay['ov']['description']
                            logo=$certificateFeatures[$certificatesToDisplay['ov']['certificate']->configoption1]["logo"]
                        }
                    {/if}
                    {if !empty($certificatesToDisplay['ev']) }
                        {include
                            file="$template/store/ssl/shared/certificate-item.tpl"
                            blockTitle="store.ssl.landingPage.digicert.title"
                            recommendedFor="store.ssl.landingPage.digicert.recommended"
                            certificate=$certificatesToDisplay['ev']['certificate']
                            features=$certificatesToDisplay['ev']['features']
                            description=$certificatesToDisplay['ev']['description']
                            logo=$certificateFeatures[$certificatesToDisplay['ev']['certificate']->configoption1]["logo"]
                        }
                    {/if}
                </div>
                <p class="help-me-choose">
                    <a href="#viewall" id="btnViewAllCerts">{lang key="store.ssl.landingPage.viewAll"}</a>
                    |
                    <a href="#helpmechoose" id="btnHelpMeChoose">{lang key="store.ssl.landingPage.choose"}</a>
                </p>
            </div>
        </div>
    {/if}

    {include file="$template/store/ssl/shared/nav.tpl" current=""}

    <div class="content-block what-is-ssl standout">
        <div class="container">

            <h2>{lang key="store.ssl.landingPage.what"}</h2>

            <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-multi.png" class="float-md-right ml-md-4 mb-4">

            <div class="text-center d-block d-sm-none">
                <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-multi.png">
                <br><br>
            </div>

            <p>{lang key="store.ssl.landingPage.whatInfo"}</p>

            <ul>
                <li class="mb-1">
                    <i class="fas fa-check-circle"></i>
                    {lang key="store.ssl.landingPage.secureConnection"}
                </li>
                <li class="mb-1">
                    <i class="fas fa-check-circle"></i>
                    {lang key="store.ssl.landingPage.encrypts"}
                </li>
                <li class="mb-1">
                    <i class="fas fa-check-circle"></i>
                    {lang key="store.ssl.landingPage.padlock"}
                </li>
                <li class="mb-1">
                    <i class="fas fa-check-circle"></i>
                    {lang key="store.ssl.landingPage.authenticates"}
                </li>
            </ul>

            <p>{lang key="store.ssl.landingPage.certTypeInfo" dvLink=routePath('store-product-group', $routePathSlug, 'dv') ovLink=routePath('store-product-group', $routePathSlug, 'ov') evLink=routePath('store-product-group', $routePathSlug, 'ev')}</p>

        </div>
    </div>

    <div class="content-block ssl-benefits standout">
        <div class="container">

            <h2>{lang key="store.ssl.landingPage.benefits.title"}</h2>

            <h4>{lang key="store.ssl.landingPage.benefits.subtitle"}</h4>

            <p>{lang key="store.ssl.landingPage.benefits.higherResults"}</p>

            <p>{lang key="store.ssl.landingPage.benefits.reasons"}:</p>

            <div class="row">
                <div class="col-lg-2 col-sm-4">
                    <i class="fas fa-globe"></i>
                    {lang key="store.ssl.landingPage.benefits.encrypt"}
                </div>
                <div class="col-lg-2 col-sm-4">
                    <i class="fas fa-user"></i>
                    {lang key="store.ssl.landingPage.benefits.privacy"}
                </div>
                <div class="col-lg-2 col-sm-4">
                    <i class="fas fa-credit-card"></i>
                    {lang key="store.ssl.landingPage.benefits.secure"}
                </div>
                <div class="col-lg-2 col-sm-4">
                    <i class="fas fa-lock"></i>
                    {lang key="store.ssl.landingPage.benefits.https"}
                </div>
                <div class="col-lg-2 col-sm-4">
                    <i class="fas fa-trophy"></i>
                    {lang key="store.ssl.landingPage.benefits.legitimacy"}
                </div>
                <div class="col-lg-2 col-sm-4">
                    <i class="fas fa-search"></i>
                    {lang key="store.ssl.landingPage.benefits.seo"}
                </div>
            </div>

        </div>
    </div>

    <div class="standout-1">
        <div class="container browser">
            <h3>{lang key="store.ssl.landingPage.browser.title"}</h3>
            <div class="browser-image">
                <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/browser-warning.jpg">
            </div>
        </div>
        <div class="browser-notice">
            <div class="wrapper-container">
                <div class="wrapper">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/padlock-x.png">
                    {lang key="store.ssl.landingPage.browser.insecureNotice"}
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="content-block competitive-upgrade-promo">
        <div class="container">
            {lang key="store.ssl.landingPage.secureInMinutes"}
        </div>
    </div>

    <div class="content-block standout">
        <div class="container secure-wildcard">
            <div class="row justify-content-between">
            <div class="col-md-8">
                <h2>{lang key="store.ssl.landingPage.evs.secureTitle"}</h2>
                <br>
                <h4>{lang key="store.ssl.landingPage.evs.wildcardSubtitle"}</h4>
                <p>{lang key="store.ssl.landingPage.evs.wildcardDescription"}</p>

                <p>{lang key="store.ssl.landingPage.evs.protectSubdomain"}</p>
                <ul>
                    <li>{lang key="store.ssl.landingPage.evs.emailServer"}</li>
                    <li>{lang key="store.ssl.landingPage.evs.webmailAccess"}</li>
                    <li>{lang key="store.ssl.landingPage.evs.ftpAccess"}</li>
                    <li>{lang key="store.ssl.landingPage.evs.websiteControl"}</li>
                </ul>
                <p>{lang key="store.ssl.landingPage.evs.dontLeave"}</p>
                <p class="text-left"><a href="{routePath('store-product-group', $routePathSlug, 'wildcard')}" class="btn btn-default">{lang key="store.ssl.landingPage.evs.compare"}</a></p>
            </div>
            <div class="col-md-push-1 col-md-3 quote-section">
                <q class="google-quote">{lang key="store.ssl.landingPage.evs.googleQuote"}</q>
                <p>~Pierre Far, Product Manager,<br>
                    Google</p>
                <img src="{$WEB_ROOT}/assets/img/auth/google_signin.png" alt="Google">
            </div>
            </div>
        </div>
    </div>

    <div class="content-block detailed-info" id="sslDetail">
        <div class="container accordion" id="sslAccordion">
            <div class="card">
                <div class="card-header" id="sslHeadingOne" role="button" data-toggle="collapse" data-target="#collapseHelpMeChoose" aria-expanded="false" aria-controls="collapseHelpMeChoose">
                    <h4>
                        <span class="arrow"><i class="fas fa-chevron-down"></i></span>
                        {lang key="store.ssl.landingPage.help.title"}
                    </h4>
                </div>
                <div id="collapseHelpMeChoose" class="collapse show" aria-labelledby="sslHeadingOne" data-parent="#sslAccordion">
                    <div class="card-body">
                        <p>{lang key="store.ssl.landingPage.help.guide"}</p>

                        <div class="row help-me-choose">
                            <div class="col-md-4">
                                <h4>{lang key="store.ssl.landingPage.help.dv.title"}</h4>

                                <ul>
                                    <li>{lang key="store.ssl.landingPage.help.dv.verify"}</li>
                                    <li>{lang key="store.ssl.landingPage.help.dv.issued"}</li>
                                    <li>{lang key="store.ssl.landingPage.help.dv.compliance"}</li>
                                </ul>

                                <p class="ideal">{lang key="store.ssl.landingPage.help.dv.for"}</p>

                                <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/card-library.png" class="img-fluid">

                                <p class="ssl-types-expl">{lang key="store.ssl.landingPage.help.dv.type"}</p>

                                <a href="{routePath('store-product-group', $routePathSlug, 'dv')}" class="btn btn-primary btn-block">{lang key="store.ssl.landingPage.help.dv.browse"}</a>

                                <hr class="d-md-none">
                            </div>
                            <div class="col-md-4">
                                <h4>{lang key="store.ssl.landingPage.help.ov.title"}</h4>

                                <ul>
                                    <li>{lang key="store.ssl.landingPage.help.ov.verify"}</li>
                                    <li>{lang key="store.ssl.landingPage.help.ov.issued"}</li>
                                    <li>{lang key="store.ssl.landingPage.help.ov.compliance"}</li>
                                </ul>

                                <p class="ideal">{lang key="store.ssl.landingPage.help.ov.for"}</p>

                                <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/card-driving.png" class="img-fluid">

                                <p class="ssl-types-expl">{lang key="store.ssl.landingPage.help.ov.type"}</p>

                                <a href="{routePath('store-product-group', $routePathSlug, 'ov')}" class="btn btn-primary btn-block">{lang key="store.ssl.landingPage.help.ov.browse"}</a>

                                <hr class="d-md-none">
                            </div>
                            <div class="col-md-4">
                                <h4>{lang key="store.ssl.landingPage.help.ev.title"}</h4>

                                <ul>
                                    <li>{lang key="store.ssl.landingPage.help.ev.verify"}</li>
                                    <li>{lang key="store.ssl.landingPage.help.ev.issued"}</li>
                                    <li>{lang key="store.ssl.landingPage.help.ev.compliance"}</li>
                                </ul>

                                <p class="ideal">{lang key="store.ssl.landingPage.help.ev.for"}</p>

                                <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/card-passport.png" class="img-fluid">

                                <p class="ssl-types-expl">{lang key="store.ssl.landingPage.help.ev.type"}</p>

                                <a href="{routePath('store-product-group', $routePathSlug, 'ev')}" class="btn btn-primary btn-block">{lang key="store.ssl.landingPage.help.ev.browse"}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="sslHeadingTwo" role="button" data-toggle="collapse" data-target="#collapseAllCerts" aria-expanded="false" aria-controls="collapseHelpMeChoose">
                    <h4>
                        <span class="arrow"><i class="fas fa-chevron-right"></i></span>
                        {lang key="store.ssl.landingPage.viewAll"}
                    </h4>
                </div>
                <div id="collapseAllCerts" class="collapse" aria-labelledby="sslHeadingTwo" data-parent="#sslAccordion">
                    <div class="card-body">
                        {include file="$template/store/ssl/shared/currency-chooser.tpl"}

                        <ul class="ssl-certs-all">
                            {if count($certificates) > 0}
                                {foreach $certificates as $type => $products}
                                    {foreach $products as $product}
                                        <li{if $product->isFeatured} class="featured"{/if}>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <h4>{$product->name}</h4>
                                                    <p>{$product->description}</p>
                                                </div>
                                                <div class="col-md-3 offset-lg-1">
                                                    <div class="padded-cell price">
                                                        {lang key='from'}<br>
                                                        <strong>{$product->pricing()->best()->yearlyPrice()}</strong>
                                                        {if $product->isFeatured}<br>{{lang key='recommended'}|upper}{/if}
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-lg-2">
                                                    <div class="padded-cell">
                                                        <form method="post" action="{routePath('cart-order')}">
                                                            <input type="hidden" name="pid" value="{$product->id}">
                                                            <button type="submit" class="btn btn-success btn-block">{lang key="store.ssl.landingPage.buyNow"}</button>
                                                        </form>
                                                        <a href="{routePath("store-product-group", $routePathSlug, $type)}">{lang key="learnmore"}</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    {/foreach}
                                {/foreach}
                            {elseif $inPreview}
                                <div class="lead text-center">
                                    {lang key="store.ssl.shared.noProducts"}
                                </div>
                            {/if}
                        </ul>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="sslHeaderMultiYear" role="button" data-toggle="collapse" data-target="#collapseMultiYear" aria-expanded="false" aria-controls="collapseHelpMeChoose">
                    <h4>
                        <span class="arrow"><i class="fas fa-chevron-right"></i></span>
                        {lang key='store.ssl.landingPage.multiYear.title'}
                    </h4>
                </div>
                <div id="collapseMultiYear" class="collapse" aria-labelledby="sslHeaderMultiYear" data-parent="#sslAccordion">
                    <div class="card-body">
                        <p>{lang key='store.ssl.landingPage.multiYear.p1'}</p>
                        <p>{lang key='store.ssl.landingPage.multiYear.p2'}</p>
                        <p>{lang key='store.ssl.landingPage.multiYear.p3'}</p>
                        <p>
                            {lang key='store.ssl.landingPage.multiYear.p4'}
                            <img class="img-fluid mx-auto d-block py-3" alt="SSL certificate lifecycle" src="{$WEB_ROOT}/assets/img/marketconnect/symantec/multi-year-flow.png">
                        </p>
                        <p>{lang key='store.ssl.landingPage.multiYear.p5'}</p>
                        <h3>{lang key='store.ssl.landingPage.multiYear.benefits.title'}</h3>
                        <ul>
                            <li>{lang key='store.ssl.landingPage.multiYear.benefits.b1'}</li>
                            <li>{lang key='store.ssl.landingPage.multiYear.benefits.b2'}</li>
                            <li>{lang key='store.ssl.landingPage.multiYear.benefits.b3'}</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="sslHeadingThree" role="button" data-toggle="collapse" data-target="#collapseFaq" aria-expanded="false" aria-controls="collapseHelpMeChoose">
                    <h4>
                        <span class="arrow"><i class="fas fa-chevron-right"></i></span>
                        {lang key="store.ssl.landingPage.faq.title"}
                    </h4>
                </div>
                <div id="collapseFaq" class="collapse" aria-labelledby="sslHeadingThree" data-parent="#sslAccordion">
                    <div class="card-body">
                        <h4>{lang key="store.ssl.landingPage.faq.q1"}</h4>

                        <p>{lang key="store.ssl.landingPage.faq.a1"}</p>

                        <h4>{lang key="store.ssl.landingPage.faq.q2"}</h4>

                        <p>{lang key="store.ssl.landingPage.faq.a2"}</p>

                        <h4>{lang key="store.ssl.landingPage.faq.q3"}</h4>

                        <p>{lang key="store.ssl.landingPage.faq.a3"}</p>

                        {if $inPreview || $certTypes.wildcard > 0}

                            <h4>{lang key="store.ssl.landingPage.faq.q4"}</h4>

                            <p>{lang key="store.ssl.landingPage.faq.a4"} <a href="{routePath('store-product-group', $routePathSlug, 'wildcard')}">{lang key="learnmore"}</a></p>

                        {/if}

                        {if $inPreview || $certTypes.ev > 0}

                            <h4>{lang key="store.ssl.landingPage.faq.q5"}</h4>

                            <p>{lang key="store.ssl.landingPage.faq.a5"}</p>

                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>

<script>
jQuery(document).ready(function() {
    jQuery(".card-header[data-toggle='collapse']").on("click", function() {
        const expand = jQuery(this).find('span.arrow:first-child i');
        if (expand.hasClass('fa-chevron-right')) {
            jQuery('.card-header span.arrow i')
                .removeClass('fa-chevron-down')
                .addClass('fa-chevron-right');
            expand.removeClass('fa-chevron-right').addClass('fa-chevron-down');
        } else {
            expand.removeClass('fa-chevron-down').addClass('fa-chevron-right');
        }
    });

    function handleAccordionNavigation(targetId, offset = 75) {
        const targetSection = jQuery('#' + targetId);
        
        if (targetSection.length) {
            jQuery('.card-header span.arrow i')
                .removeClass('fa-chevron-down')
                .addClass('fa-chevron-right');

            targetSection.collapse('show');

            targetSection.prev('.card-header')
                .find('span.arrow i')
                .removeClass('fa-chevron-right')
                .addClass('fa-chevron-down');

            setTimeout(() => {
                jQuery('html, body').animate({
                    scrollTop: targetSection.offset().top - offset
                }, 500);
            }, 300)
        }
    }
    
    jQuery('#btnViewAllCerts').click(function(e) {
        e.preventDefault();
        handleAccordionNavigation('collapseAllCerts');
    });
    
    jQuery('#btnHelpMeChoose').click(function(e) {
        e.preventDefault();
        handleAccordionNavigation('collapseHelpMeChoose');
    });
    
    const hash = location.hash.replace('#', '');

    if (hash === 'viewall') {
        handleAccordionNavigation('collapseAllCerts');
    } else if (hash === 'helpmechoose') {
        handleAccordionNavigation('collapseHelpMeChoose');
    }
});
</script>
