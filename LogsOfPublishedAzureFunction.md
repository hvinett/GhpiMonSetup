# How to get logs of requests made to azure funtion that got published
Go to azure portal and navigate [here](https://ms.portal.azure.com/#@microsoft.onmicrosoft.com/resource/subscriptions/fd8ab19b-944d-40f1-b13b-e2036680bf7e/resourceGroups/aj-controlpane/providers/Microsoft.Web/sites/extensionexecutor/appInsightsQueryLogs)

#### Query to get info of last 20 requets
```
requests
| project timestamp, id, operation_Name, success, resultCode, duration, operation_Id, cloud_RoleName, invocationId=customDimensions['InvocationId']
| where timestamp > ago(30d)
| where cloud_RoleName =~ 'extensionexecutor' and operation_Name =~ 'ghpiextension'
| order by timestamp desc
| take 20
```

#### Query to get traces of specific request
pickup the operationid of your request based on timestamp of your request
```
traces 
| where operation_Id == "0744f10544f5c748b838d318e62a93f7" 
```
