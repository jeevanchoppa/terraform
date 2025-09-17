#Create vpc
resource "aws_vpc" "project_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "project_vpc"
  }
}

# create public subnet1
resource "aws_subnet" "project_public_subnet1" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}
# create public subnet2
resource "aws_subnet" "project_public_subnet2" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

}
#create private subnet1
resource "aws_subnet" "project_private_subnet1" {
  vpc_id            = aws_vpc.project_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
}
# create private subnet2
resource "aws_subnet" "project_private_subnet2" {
  vpc_id            = aws_vpc.project_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
}
#create a public route table
resource "aws_route_table" "project_public_rtb1" {
  depends_on = [aws_internet_gateway.project_igw]
  vpc_id     = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_igw.id
  }
}



##nroute tabe associations
resource "aws_route_table_association" "project_public_rtbass_public1" {
  subnet_id      = aws_subnet.project_public_subnet1.id
  route_table_id = aws_route_table.project_public_rtb1.id
}
resource "aws_route_table_association" "project_public_rtbass_public2" {
  subnet_id      = aws_subnet.project_public_subnet2.id
  route_table_id = aws_route_table.project_public_rtb1.id
}

resource "aws_internet_gateway" "project_igw" {
  vpc_id = aws_vpc.project_vpc.id

}

resource "aws_route_table" "project_private_rtb1" {
  vpc_id = aws_vpc.project_vpc.id
}

resource "aws_route_table_association" "project_private_rtbass_private1" {
  subnet_id      = aws_subnet.project_private_subnet1.id
  route_table_id = aws_route_table.project_private_rtb1.id
}

resource "aws_route_table_association" "project_private_rtbass_private2" {
  subnet_id      = aws_subnet.project_private_subnet2.id
  route_table_id = aws_route_table.project_private_rtb1.id
}