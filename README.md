# Build Real-Time Data Pipeline using AWS Kinesis and Snowflake
## Business Overview
A real-time data pipeline is a critical data engineering practice designed to seamlessly
integrate live data from diverse sources such as IoT devices, clickstream data, APIs,
and web servers. This real time generated data is then transformed into meaningful
insights for analytics and loaded into designated destination systems in real-time. This
approach has become indispensable for organizations aiming to manage large volumes
of real-time data efficiently and automatically.

Real-time data pipelines enable organizations to process data as soon as it is
generated, facilitating instant insights and analytics. This capability is essential for a
wide range of applications, including online stores, startups, and AI companies. By
deploying real-time data pipelines, these organizations can drive insights rapidly and
effectively.

## Key features:
1. **Complex Workflow Handling**: Real-time pipelines manage intricate data
workflows seamlessly.
2. **Data Quality Assurance**: They ensure data accuracy, completeness, and
manage upserts during transformations/ loading.
3. **Unified Data Integration**: They consolidate data from diverse sources into a
cohesive format.
4. **Cost Efficiency**: By updating destination systems with only new records,
real-time pipelines optimize computational resources and reduce costs
effectively.



## Aim:
The aim of this project is to analyze real-time global market data using AWS Kinesis and
Snowflake. By utilizing CSV datasets extracted via API calls, streaming them through
Kinesis Firehose, and transforming them with Snowflake. The agile workflow ensures
efficiency, providing a one stop comprehensive solution for real-time data insights. AWS
services include S3 for storage, Kinesis Firehose for streaming, Lambda for serverless
computing, AppRunner for deployment of API, Snowpipe for auto ingestion of raw data
from destination S3 bucket, Snowpark for processing raw data into cleaned data and
Power BI for data visualization. This project leverages AWS services like S3, Kinesis
Firehose, Lambda, and AppRunner for data management and API construction.
Snowflake acts as the robust data warehouse, while Power BI visualizes real-time
global market insights.

## Tech Stack:
➢ **Programming**: Python, SQL

➢ **AWS Services**: AWS Kinesis, AWS App Runner, AWS Kinesis Firehose, AWS
S3, AWS LAMBDA

➢ **Warehouse**: Snowflake

➢ **Visualization**: Power BI

➢ **Libraries**: Boto3, requests, pandas

## Data description:
The dataset constitutes a comprehensive view of the global food market across 36
countries and 2,200 markets spanning from January 1, 2007, to May 1, 2023. It includes
detailed information on various aspects such as country specifics, market details, and
diverse food items with associated price points (low, high, open, close), inflation rates,
and trust indicators for each item.
To manage this extensive dataset efficiently, it was stored in AWS S3, leveraging its
capabilities to handle large volumes of data effectively and ensuring rapid access
speeds essential for transferring data to FastAPI. Real-time AWS services were
subsequently employed to establish a seamless workflow, optimizing data retrieval
through APIs only when needed. AWS S3 and real-time AWS services were
instrumental in facilitating efficient data management and enabling responsive data
access for analysis and decision-making purposes.

## Architecture Diagram:
![Screenshot 2024-10-04 184047](https://github.com/user-attachments/assets/fda2f03e-2aed-48b3-aabb-6ec6f37e8240)

