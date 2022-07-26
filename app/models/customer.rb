class Customer < ApplicationRecord
    has_many :buildings
    belongs_to :user
    belongs_to :address
    has_one :lead

    # pp "----12333---------"

    # after_create :migrate_files_to_dropbox
    # after_update :migrate_files_to_dropbox


    # def migrate_files_to_dropbox
    #     pp "---------1155555----"
    #     pp self.Email_Of_The_Company_Contact
    #     pp "---------1155555----"

    #     dropbox_client = DropboxApi::Client.new ENV['DROPBOX_OAUTH_BEARER']
    #     test = Lead.where(email: self.Email_Of_The_Company_Contact)
    #     pp "****"
    #     pp test
        
    #     Lead.where(email: self.Email_Of_The_Company_Contact).each do |lead|
    #         pp "----23---------"
    #         pp lead.attachement
    #         pp "-------------"
    #         unless lead.attachement.nil?
    #             dir_path = "/" + self.Company_Name
    #             begin
    #                 dropbox_client.create_folder dir_path
    #             rescue DropboxApi::Errors::FolderConflictError => err
    #                 puts "Folder already exists"
                    
    #             end
    #             begin
    #                 pp "----6788779809-90-09-9909-99009-=0=90=09090---------"
    #                 pp lead.attachement.blob.service.path_for(lead.attachement.blob.key)
    #                 pp "------yi7979786557575758697080700897685768996-------"
    #                 dropbox_client.upload(dir_path + '/' + lead.attachement.filename.to_s, lead.attachement.blob.service.path_for(lead.attachement.blob.key))
    #             rescue DropboxApi::Errors::FolderConflictError => err
    #                 puts "File already exists"
    #             end

    #             #lead.attachement = nil;
    #             lead.attachement.destroy
    #             lead.save!
    #         end
    #     end
    # end

    
end







# after_create do |customer|
#     dropbox_upload
# end

# after_update do |customer|
#     dropbox_upload
# end


# def dropbox_upload
#     client = DropboxApi::Client.new("sl.BLdlQzkxGLVgF92W6vhFbcTe4LxpILS65dffbXSYVun8uPi-5DMcCK0mNWbBUv7IzcvMRNZ3r909ei53-lnGxepk-yWFfkNemKcxxVSTBGcST4bSwL5rHfr7COvepY6Ca-dbsPRHiMyY")
#     leads = Lead.all
#     leads.each do |lead|
#         if lead.attachement
#             file_name = lead.attachement.filename
#             file_content = lead.attachement.blob.download
#             puts lead.attachment
#             client.upload("/#{lead.Company_Name}/#{lead.attachement.filename}", file_content)
#             lead.destroy
#         end
#     end
# end

#pol = ActiveStorage::Blob.service.path_for(lead.attachement.key)