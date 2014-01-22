class Weibo < ActiveRecord::Base
  after_create :generate_image
  mount_uploader :image,ImageUploader
  private 
  def generate_image
      file = Tempfile.new(["template_#{self.id.to_s}", 'jpg'], 'tmp', :encoding => 'ascii-8bit')
      weibo = "<!DOCTYPE html><html lang='zh-cn'><head><meta charset='UTF-8'></head><body>#{self.weibo.gsub("\n","<br />")}</body></html>"
      file.write(IMGKit.new(weibo, quality: 50, width: 600,height:0).to_jpg)
      file.flush
      self.image = file
      self.save
      file.unlink
  end
end
