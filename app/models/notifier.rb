class Notifier < ActionMailer::Base
	helper ActionView::Helpers::UrlHelper

  def generic_mailer(options)
      @recipients = options[:recipients] || "ganga.reddy@pagalguy.com"
      @from = options[:from] || "basecamphq@pagalguy.com"

      @cc = options[:cc] || "naga.gangadhar@gmail.com"
      @bcc = options[:bcc] || ""

      @subject = options[:subject] || ""
      @body = options[:body] || {}

      @headers = options[:headers] || {}
      @charset = options[:charset] || "utf-8"
   end
end
