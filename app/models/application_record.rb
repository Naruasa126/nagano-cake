class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  Refile.secret_key ='04a7450d5674cfd64a17ab62dff865ccb67f762dfb6f095d2926d8c6435c44d42f5e4b227e053c3e2d1cf5228cdc6ce3af7d4aec9fbb0d1d0932727d0859906e'
end
