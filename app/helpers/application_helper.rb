module ApplicationHelper

  def avilable_language
    I18n.locale == :ja ? :en : :ja
  end

  def avilable_language_in_words
    I18n.locale == :ja ? t('common.languages.english') : t('common.languages.japanese')
  end

  def set_locale
    cookies[:locale] = (params[:id] || I18n.default_locale).to_s
  end

  def default_meta_tags
     {
       site: 'Talkie Board',
       title: '',
       reverse: true,
       charset: 'utf-8',
       description: 'Multilingual communication board for aphasia. 失語症の人の為のコミュニケーションボード。',
       keywords: 'コミュニケーションボード,失語,コミュニケーション,communication,board,aphasia,speach,therapy',
       canonical: request.original_url,
       separator: '|',
       # icon: [
       #   { href: image_url('favicon.ico') },
       #   { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
       # ],
       og: {
         site_name: 'Talkie Board',
         title: '',
         description: 'Multilingual communication board for aphasia',
         type: 'website',
         url: request.original_url,
         # image: image_url('ogp.png'),
         locale: 'ja_JP',
       },
       twitter: {
         card: 'summary',
         site: '',
       }
     }
   end

end
