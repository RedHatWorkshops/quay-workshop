<!doctype html>

<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Lab Environment &mdash; ${lab_name}</title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.7/styles/default.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <style type="text/css">
    @media print {
        a[href]:after {
            content: none;
        }
    }

    pre {
        overflow: auto;
        word-wrap: normal;
        white-space: pre;
    }

    .node-id {
        font-size: 4em;
    }

    .ip-address {
        font-size: 2.5em;
    }

    .code-block {
        background: #f5f5f5;
    }

    .text-monospace {
        font-family: monospace;
    }
    </style>
</head>
<body>

    <div class="container">
        <h1>Lab Environment <small>${lab_name}</small></h1>
    </div>

    <div class="container">
        <h3>Master</h3>
        <table class="table table-bordered table-hover table-striped">
            <tbody>
                <tr>
                    <td>
                        <div class="list-group-item-text">
                          <h4 class="list-group-item-heading">Exercises</h4>
                          <p class="ip-address"><a href="http://${cluster_name}.${domain_name}" target="_blank">${cluster_name}.${domain_name}</a></p>
                        </div>
                    </td>

                    <td>
                        <ul class="list-unstyled text-monospace">
                            <li><strong>Username:</strong> kubernetes</li>
                            <li><strong>Password:</strong> coreostrainme</li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="container">
        <h3>Bastion</h3>
        <table class="table table-bordered table-hover table-striped">
            <tbody>
                <tr>
                    <td>
                        <div class="list-group-item-text">
                          <h4 class="list-group-item-heading">SSH Access</h4>
                          <p class="ip-address"><a href="http://${cluster_name}-${lab_name}-bastion.${domain_name}" target="_blank">${cluster_name}-${lab_name}-bastion.${domain_name}</a></p>
                        </div>
                    </td>

                    <td>
                        <ul class="list-unstyled text-monospace">
                            <li><strong>Username:</strong> lab</li>
                            <li><strong>Password:</strong> &lt;SSH Key&gt;</i></li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="container">
        <h3>Tectonic Console</h3>
        <table class="table table-bordered table-hover table-striped">
            <tbody>
                <tr>
                    <td>
                        <div class="list-group-item-text">
                          <h4 class="list-group-item-heading">Console Access</h4>
                          <p class="ip-address"><a href="http://${cluster_name}-${lab_name}.${domain_name}" target="_blank">${cluster_name}-${lab_name}.${domain_name}</a></p>
                        </div>
                    </td>

                    <td>
                        <ul class="list-unstyled text-monospace">
                            <li><strong>Username:</strong> lab@coreostrain.me</li>
                            <li><strong>Password:</strong> coreostrainme</li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.7/highlight.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
            hljs.initHighlightingOnLoad();
        })
    </script>

</body>
</html>
