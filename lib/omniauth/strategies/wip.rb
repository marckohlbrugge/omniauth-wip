# frozen_string_literal: true

require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class WIP < OmniAuth::Strategies::OAuth2
      option :name, "wip"

      option :client_options,
             site: "https://wip.chat",
             authorize_url: "/oauth/authorize"

      uid { raw_info["id"] }

      info do
        {
          username: raw_info["username"],
          url: raw_info["url"],
          name: [raw_info["first_name"], raw_info["last_name"]].compact.join(" ")
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= wip_client
      end

      # https://github.com/intridea/omniauth-oauth2/issues/81
      def callback_url
        full_host + script_name + callback_path
      end

      private

      def wip_client
        data = make_request viewer_query
        data["viewer"]
      end

      def viewer_query
        %(
          {
            viewer {
              id
              username
              url
              first_name
              last_name
            }
          }
        )
      end

      def make_request(query)
        response = Faraday.post("https://wip.chat/graphql") do |request|
          request.headers["Authorization"] = "bearer #{credentials["token"]}"
          request.headers["Content-Type"] = "application/json"
          request.body = { query: query }.to_json
        end

        json = JSON.parse(response.body)
        raise json["errors"].first["message"] if json.key? "errors"

        json["data"]
      end
    end
  end
end

OmniAuth.config.add_camelization "wip", "WIP"
