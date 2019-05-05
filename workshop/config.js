var google_analytics = `
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-135921114-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-135921114-5');
</script>
`;

var config = {
    site_title: 'Build Your Own Operator (hands-on workshop)',

    analytics: google_analytics,

    variables: [
        {
            name: 'jupyterhub_namespace',
            content: process.env.JUPYTERHUB_NAMESPACE
        },
        {
            name: 'jupyterhub_application',
            content: process.env.JUPYTERHUB_APPLICATION
        }
    ]
};

module.exports = config;
