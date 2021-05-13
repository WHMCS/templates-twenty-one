<link href="{assetPath file='store.css'}" rel="stylesheet">

<div class="landing-page bg-white sitelock">

    <div class="hero">
        <div class="container">
            <div class="logo-container">
                <img src="{$WEB_ROOT}/assets/img/marketconnect/sitelock/logo.png">
            </div>
            <h2>{lang key="store.sitelock.tagline"}</h2>
        </div>
    </div>

    <nav class="navbar navbar-light bg-light navbar-expand-lg p-0">
      <div class="container">
        <span class="navbar-brand"></span>
        <button type="button" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#nav-landing-page" aria-expanded="false">
          <span class="sr-only">{lang key="toggleNav"}</span>
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="nav-landing-page">
          <ul class="nav navbar-nav">
            <li class="nav-item"><a class="nav-link" href="#" onclick="smoothScroll('#plans');return false">{lang key="store.sitelock.plansAndPricing"}</a></li>
            <li class="nav-item"><a class="nav-link" href="#" onclick="smoothScroll('#features');return false">{lang key="store.sitelock.featuresLink"}</a></li>
            <li class="nav-item"><a class="nav-link" href="#" onclick="smoothScroll('#emergency');return false">{lang key="store.sitelock.websiteHacked"}</a></li>
            <li class="nav-item"><a class="nav-link" href="#" onclick="smoothScroll('#faq');return false">{lang key="store.sitelock.faq"}</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="content-block">
        <div class="container">
            <h2>{lang key="store.sitelock.contentHeadline"}</h2>
            <br>
            <p>{lang key="store.sitelock.contentBodyParagraph1"}</p>
            <p>{lang key="store.sitelock.contentBodyParagraph2"}</p>
            <p>{lang key="store.sitelock.contentBodyParagraph3"}</p>
        </div>
    </div>

    <div class="content-block plans" id="plans">
        <div class="container">
            {if !$loggedin && $currencies}
                <form method="post" action="" class="float-right">
                    <select name="currency" class="form-control currency-selector" onchange="submit()">
                        <option>{lang key="changeCurrency"} ({$activeCurrency.prefix} {$activeCurrency.code})</option>
                        {foreach $currencies as $currency}
                            <option value="{$currency['id']}">{$currency['prefix']} {$currency['code']}</option>
                        {/foreach}
                    </select>
                </form>
            {/if}
            <h2>{lang key="store.sitelock.comparePlans"}</h2>
            <h3>{lang key="store.sitelock.comparePlansSubtitle"}</h3>
            <div class="row plan-comparison">
                {foreach $plans as $plan}
                    <div class="col-md-6 col-lg-{if count($plans) == 4}3{elseif count($plans) == 3}4{elseif count($plans) == 2}4 {if $plan@first}offset-lg-2{/if}{else}4 offset-lg-4{/if} {if count($plans) == 1}offset-md-3{/if}">
                        <div class="plan">
                            <div class="header">
                                <h4>
                                    {$plan->name}
                                    <span class="float-right">
                                        {if $plan->isFree()}
                                            {lang key="orderpaymenttermfree"}
                                        {elseif $plan->pricing()->annually()}
                                            {$plan->pricing()->annually()->toPrefixedString()}
                                        {elseif $plan->pricing()->first()}
                                            {$plan->pricing()->first()->toPrefixedString()}
                                        {else}
                                            -
                                        {/if}
                                    </span>
                                </h4>
                                <p>{$plan->description}</p>
                            </div>
                            <ul>
                                {foreach $plan->features as $label => $value}
                                    <li>
                                        <span>{$label}</span>
                                        {if is_bool($value)}
                                            <i class="fas fa-{if $value}check{else}times{/if}"></i>
                                        {else}
                                            {$value}
                                        {/if}
                                    </li>
                                {/foreach}
                            </ul>
                            <div class="footer">
                                <form method="post" action="{routePath('cart-order')}">
                                    <input type="hidden" name="pid" value="{$plan->id}">
                                    <select name="billingcycle" class="form-control">
                                        {foreach $plan->pricing()->allAvailableCycles() as $cycle}
                                            <option value="{$cycle->cycle()}">
                                                {if $cycle->isRecurring()}
                                                    {if $cycle->isYearly()}
                                                        {$cycle->cycleInYears()}
                                                    {else}
                                                        {$cycle->cycleInMonths()}
                                                    {/if}
                                                    -
                                                {/if}
                                                {$cycle->toFullString()}</option>
                                        {/foreach}
                                    </select>
                                    <button type="submit" class="btn btn-block">{lang key="store.sitelock.buyNow"}</button>
                                </form>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>

        </div>
    </div>

    <div class="content-block features" id="features">
        <div class="container">
            <h2>{lang key="store.sitelock.featuresTitle"}</h2>
            <h3>{lang key="store.sitelock.featuresHeadline"}</h3>
            <br>
            <div class="row">
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-search fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.featuresMalwareTitle"}</h4>
                            <p>{lang key="store.sitelock.featuresMalwareContent"}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-wrench fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.featuresMalwareRemovalTitle"}</h4>
                            <p>{lang key="store.sitelock.featuresMalwareRemovalContent"}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-code fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.featuresVulnerabilityTitle"}</h4>
                            <p>{lang key="store.sitelock.featuresVulnerabilityContent"}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="far fa-file-code fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.featuresOWASPTitle"}</h4>
                            <p>{lang key="store.sitelock.featuresOWASPContent"}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-trophy fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.featuresTrustSealTitle"}</h4>
                            <p>{lang key="store.sitelock.featuresTrustSealContent"}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-shield-alt fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.featuresFirewallTitle"}</h4>
                            <p>{lang key="store.sitelock.featuresFirewallContent"}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-lock fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.featuresReputationTitle"}</h4>
                            <p>{lang key="store.sitelock.featuresReputationContent"}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-star fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.featuresSetupTitle"}</h4>
                            <p>{lang key="store.sitelock.featuresSetupContent"}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-globe fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.featuresCDNTitle"}</h4>
                            <p>{lang key="store.sitelock.featuresCDNContent"}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {if !is_null($emergencyPlan)}
    <div class="content-block emergency" id="emergency">
        <div class="container">
            <h2 class="text-danger">{lang key="store.sitelock.emergencyPlanTitle"}</h2>
            <h3>{lang key="store.sitelock.emergencyPlanHeadline"}</h3>
            <p>{lang key="store.sitelock.emergencyPlanBody"}</p>
            <br>
            <div class="row">
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="far fa-clock fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.emergencyPlanResponseTitle"}</h4>
                            <p>{lang key="store.sitelock.emergencyPlanResponseContent"}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-times fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.emergencyPlanMalwareTitle"}</h4>
                            <p>{lang key="store.sitelock.emergencyPlanMalwareContent"}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-exclamation-circle fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.emergencyPlanPriorityTitle"}</h4>
                            <p>{lang key="store.sitelock.emergencyPlanPriorityContent"}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="far fa-calendar-check fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.emergencyPlanAftercareTitle"}</h4>
                            <p>{lang key="store.sitelock.emergencyPlanAftercareContent"}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="far fa-envelope fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.emergencyPlanUpdatesTitle"}</h4>
                            <p>{lang key="store.sitelock.emergencyPlanUpdatesContent"}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-star fa-fw"></i>
                        <div class="content">
                            <h4>{lang key="store.sitelock.emergencyPlanPaymentTitle"}</h4>
                            <p>{lang key="store.sitelock.emergencyPlanPaymentContent"}</p>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="clearfix">
                <div class="price float-left">
                    {lang key="store.sitelock.emergencyPlanOnlyCost" price="{if $emergencyPlan->pricing()->best()}{$emergencyPlan->pricing()->best()->toFullString()}{else}-{/if}" }
                </div>
                <form method="post" action="{routePath('cart-order')}">
                    <input type="hidden" name="pid" value="{$emergencyPlan->id}">
                    <button type="submit" class="btn btn-default mt-3 mt-lg-0 float-lg-right">
                        {lang key="store.sitelock.buyNow"}
                    </button>
                </form>
            </div>
        </div>
    </div>
    {/if}

    <div class="content-block faq" id="faq">
        <div class="container accordion" id="faqAccordion">
            <h2 class="mb-4">{lang key="store.sitelock.faqTitle"}</h2>
            <div class="card bg-default m-0">
                <div class="card-header" id="faqOne" role="button" data-toggle="collapse" data-target="#collapseFaqOne" aria-expanded="true" aria-controls="collapseFaqOne">
                    <h4 class="m-0">
                        {lang key="store.sitelock.faqOneTitle"}
                    </h4>
                </div>
                <div id="collapseFaqOne" class="collapse" aria-labelledby="faqOne" data-parent="#faqAccordion">
                    <div class="card-body">
                        {lang key="store.sitelock.faqOneBody"}<br/><br/>
                        {lang key="store.sitelock.faqOneBodyLearnMore" learnMoreLink={$learnMoreLink}}
                    </div>
                </div>
            </div>
            <div class="card bg-default m-0">
                <div class="card-header" id="faqTwo" role="button" data-toggle="collapse" data-target="#collapseFaqTwo" aria-expanded="true" aria-controls="collapseFaqTwo">
                    <h4 class="m-0">
                        {lang key="store.sitelock.faqTwoTitle"}
                    </h4>
                </div>
                <div id="collapseFaqTwo" class="collapse" aria-labelledby="faqTwo" data-parent="#faqAccordion">
                    <div class="card-body">
                        {lang key="store.sitelock.faqTwoBody"}
                    </div>
                </div>
            </div>
            <div class="card bg-default m-0">
                <div class="card-header" id="faqThree" role="button" data-toggle="collapse" data-target="#collapseFaqThree" aria-expanded="true" aria-controls="collapseFaqThree">
                    <h4 class="m-0">
                        {lang key="store.sitelock.faqThreeTitle"}
                    </h4>
                </div>
                <div id="collapseFaqThree" class="collapse" aria-labelledby="faqThree" data-parent="#faqAccordion">
                    <div class="card-body">
                        {lang key="store.sitelock.faqThreeBody"}<br/>
                        <ul>
                            <li>{lang key="store.sitelock.faqThreeBodyList1"}</li>
                            <li>{lang key="store.sitelock.faqThreeBodyList2"}</li>
                            <li>{lang key="store.sitelock.faqThreeBodyList3"}</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="card bg-default m-0">
                <div class="card-header" id="faqFour" role="button" data-toggle="collapse" data-target="#collapseFaqFour" aria-expanded="true" aria-controls="collapseFaqFour">
                    <h4 class="m-0">
                        {lang key="store.sitelock.faqFourTitle"}
                    </h4>
                </div>
                <div id="collapseFaqFour" class="collapse" aria-labelledby="faqFour" data-parent="#faqAccordion">
                    <div class="card-body">
                        {lang key="store.sitelock.faqFourBodyParagraph1" vulnerabilityStrong="<strong>{lang key="store.sitelock.websiteVulnerability"}</strong>"}<br/><br/>
                        {lang key="store.sitelock.faqFourBodyParagraph2" malwareStrong="<strong>{lang key="store.sitelock.malware"}</strong>"}<br/><br/>
                    </div>
                </div>
            </div>
            <div class="card bg-default m-0">
                <div class="card-header" id="faqFive" role="button" data-toggle="collapse" data-target="#collapseFaqFive" aria-expanded="true" aria-controls="collapseFaqFive">
                    <h4 class="m-0">
                        {lang key="store.sitelock.faqFiveTitle"}
                    </h4>
                </div>
                <div id="collapseFaqFive" class="collapse" aria-labelledby="faqFive" data-parent="#faqAccordion">
                    <div class="card-body">
                        {lang key="store.sitelock.faqFiveBody"}
                    </div>
                </div>
            </div>
            <div class="card bg-default m-0">
                <div class="card-header" id="faqSix" role="button" data-toggle="collapse" data-target="#collapseFaqSix" aria-expanded="true" aria-controls="collapseFaqSix">
                    <h4  class="m-0">
                        {lang key="store.sitelock.faqSixTitle"}
                    </h4>
                </div>
                <div id="collapseFaqSix" class="collapse" aria-labelledby="faqSix" data-parent="#faqAccordion">
                    <div class="card-body">
                        {lang key="store.sitelock.faqSixBody"}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block">
        <div class="container text-center">
            <img src="{$WEB_ROOT}/assets/img/marketconnect/sitelock/logo.png">
        </div>
    </div>

</div>
