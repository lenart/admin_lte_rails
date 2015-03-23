# To use this helper in your application do this in your AdminController
#
# helper 'admin_lte_rails/translations'

module AdminLteRails
  module TranslationsHelper

    # Returns true/false if translation exists for model in passed locale
    # Locale defaults to current locale
    def translation_exists?(model, locale: I18n.locale)
      if model.respond_to? :available_locales
        model.available_locales.include?(locale)
      else
        true
      end
    end

    # Returns `translation-missing` if model doesn't have translation in
    # passed locale. Locale defaults to current locale
    def translation_class(model, locale: I18n.locale)
      translation_exists?(model, locale: locale) ? nil : 'translation-missing'
    end

  end
end