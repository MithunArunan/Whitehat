#Installation and configuration (credentials) of the AWS CLI
# http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html
#Advanced guide: https://github.com/wallix/awless/wiki/Getting-Started

#AWS S3 API help
aws s3 help

#To list all the buckets
aws s3 ls

#To list all the objects of the bucket
aws s3 ls s3://mithunarunan --region ap-southeast-1

#To create/upload an object in the bucket
aws s3 cp ~/Desktop/Bikes/r15blue.jpeg s3://mithunarunan --storage-class REDUCED_REDUNDANCY --region ap-southeast-1

#To Create/Upload an object in the bucket
aws s3 cp filename.txt s3://test.example.com --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers --region ap-southeast-1 

#Copy an object from the bucket
aws s3 cp s3://mithunarunan/r15red.jpg ~/Desktop/

#AWS S3API Help
aws s3api help

#S3 bucket location
aws s3api get-bucket-location --bucket BUCKET

#Add bucket wide ACL policy
aws s3api put-bucket-acl --bucket MyBucket --grant-full-control 'emailaddress="user1@example.com",emailaddress="user2@example.com"' --grant-read 'uri="http://acs.amazonaws.com/groups/global/AllUsers"'


#####USE WITH CAUTION########

#Move all the objects from the bucket recursively
aws s3 mv s3://mithunarunan ~/Desktop/ --exclude '*' --include '*.jpg' --recursive
