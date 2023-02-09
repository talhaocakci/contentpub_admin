
resource "aws_dynamodb_table" "AmplifyDataStoreDdbTable" {
    attribute {
        name = "ds_pk"
        type = "S"
    }
    attribute {
        name = "ds_sk"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "AmplifyDataStore-${var.base_bucket_name}-staging"
    hash_key = "ds_pk"
    range_key = "ds_sk"
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
    ttl {
        attribute_name = "_ttl"
        enabled = true
    }
}

resource "aws_dynamodb_table" "BundleEntityDdbTable" {
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "Bundle-${var.base_bucket_name}-staging"
    hash_key = "id"
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "ContentCoworkerEntityDdbTable" {
    attribute {
        name = "contentId"
        type = "S"
    }
    attribute {
        name = "coworkerId"
        type = "S"
    }
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "ContentCoworker-${var.base_bucket_name}-staging"
    hash_key = "id"
    global_secondary_index {
        name = "byContent"
        hash_key = "contentId"
        projection_type = "ALL"
        read_capacity = 0
        write_capacity = 0
    }
    global_secondary_index {
        name = "byCoworker"
        hash_key = "coworkerId"
        projection_type = "ALL"
        read_capacity = 0
        write_capacity = 0
    }
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "CoworkerEntityDdbTable" {
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "Coworker-${var.base_bucket_name}-staging"
    hash_key = "id"
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "ContentEntityDdbTable" {
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "Content-${var.base_bucket_name}-staging"
    hash_key = "id"
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "CustomerEntityDdbTable" {
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "Customer-${var.base_bucket_name}-staging"
    hash_key = "id"
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "CourseEntityDdbTable" {
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "Course-${var.base_bucket_name}-staging"
    hash_key = "id"
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "TenantEntityDdbTable" {
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "Tenant-${var.base_bucket_name}-staging"
    hash_key = "id"
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "LessonEntityDdbTable" {
    attribute {
        name = "id"
        type = "S"
    }
    attribute {
        name = "sectionID"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "Lesson-${var.base_bucket_name}-staging"
    hash_key = "id"
    global_secondary_index {
        name = "bySection"
        hash_key = "sectionID"
        projection_type = "ALL"
        read_capacity = 0
        write_capacity = 0
    }
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "SectionEntityDdbTable" {
    attribute {
        name = "courseID"
        type = "S"
    }
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "Section-${var.base_bucket_name}-staging"
    hash_key = "id"
    global_secondary_index {
        name = "byCourse"
        hash_key = "courseID"
        projection_type = "ALL"
        read_capacity = 0
        write_capacity = 0
    }
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "PurchaseEntityDdbTable" {
    attribute {
        name = "customerID"
        type = "S"
    }
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "Purchase-${var.base_bucket_name}-staging"
    hash_key = "id"
    global_secondary_index {
        name = "byCustomer"
        hash_key = "customerID"
        projection_type = "ALL"
        read_capacity = 0
        write_capacity = 0
    }
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "BundleContentEntityDdbTable" {
    attribute {
        name = "bundleId"
        type = "S"
    }
    attribute {
        name = "contentId"
        type = "S"
    }
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "BundleContent-${var.base_bucket_name}-staging"
    hash_key = "id"
    global_secondary_index {
        name = "byBundle"
        hash_key = "bundleId"
        projection_type = "ALL"
        read_capacity = 0
        write_capacity = 0
    }
    global_secondary_index {
        name = "byContent"
        hash_key = "contentId"
        projection_type = "ALL"
        read_capacity = 0
        write_capacity = 0
    }
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "PriceEntityDdbTable" {
    attribute {
        name = "bundleID"
        type = "S"
    }
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "Price-${var.base_bucket_name}-staging"
    hash_key = "id"
    global_secondary_index {
        name = "byBundle"
        hash_key = "bundleID"
        projection_type = "ALL"
        read_capacity = 0
        write_capacity = 0
    }
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}

resource "aws_dynamodb_table" "TenantConfigurationEntityDdbTable" {
    attribute {
        name = "id"
        type = "S"
    }
    billing_mode = "PAY_PER_REQUEST"
    name = "TenantConfiguration-${var.base_bucket_name}-staging"
    hash_key = "id"
    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}
