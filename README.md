# LogicAppGPTVision
A small demo showing an approach to using a Logic App to transform a screenshot into structured data using GPT-4 Vision on Azure OpenAI

## One-Click Deploy - Logic App Consumption
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FScottHolden%2FLogicAppGPTVision%2Fmain%2Fdeploy%2Fconsumption%2Fdeploy.generated.json)


## How to demo
1. [Create an Azure OpenAI resource](https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/create-resource) in a [region that supports GPT-4 Vision.](https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/models#gpt-4-and-gpt-4-turbo-preview-model-availability)
1. Deploy the Logic App using the button above or the [templates within the repo](./deploy/consumption/deploy.bicep), filling in the Azure OpenAI [resource key and endpoint](https://learn.microsoft.com/en-us/azure/ai-services/openai/chatgpt-quickstart?tabs=command-line%2Cpython-new&pivots=rest-api#set-up), and the [deployment name](https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/create-resource?pivots=web-portal#deploy-a-model) for the GPT-4 vision deployment.
1. Once created, navigate to the Logic App and open the designer. Copy the [invoke URL from the HTTP trigger](https://learn.microsoft.com/en-us/azure/connectors/media/connectors-native-reqres/generated-url-consumption.png).
1. Ensure you have the REST Client add-on installed for VSCode. Update line 1 of [test.http](./test.http) to point to the Logic App, and click 'Send Request'. _It may take up to 60 seconds to return a result, so be patient!_

## Example
A screenshot/image (left hand side) is POST'ed to the Logic App (middle) and returns a set of structured data based on the prompt and json schema in the workflow.  
![An example](media/example-1.png)
This example shows how a screenshot submitted to a help desk could be broken down into structured data and reasoned with for potential follow-up actions.