if Rails.env == "production"
  # set credentials from ENV hash
  S3_CREDENTIALS = { :access_key_id => 'AKIAIYDIPBOEM6L7DSGQ', :secret_access_key => '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', :bucket => "route67"}
else
  # get credentials from YML file
  S3_CREDENTIALS = { :access_key_id => 'AKIAIYDIPBOEM6L7DSGQ', :secret_access_key => '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', :bucket => "route67"}
end