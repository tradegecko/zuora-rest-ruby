# frozen_string_literal: true

module Zuora
  class DataQuery

    class << self
      def schedule_job(params)
        response = Zuora::HttpClient.post(query_job_url, body: default_params.merge(params).to_json, headers: auth_header)
        handle_response(response)
      end

      def find(job_id)
        response = Zuora::HttpClient.get(find_job_url(job_id), headers: auth_header)
        handle_response(response)
      end

      def query_job_url
        "#{Zuora.base_url}/query/jobs"
      end

      def find_job_url(job_id)
        "#{Zuora.base_url}/query/jobs/#{job_id}"
      end

    private

      def auth_header
        {
          Authorization: "Bearer #{AccessToken.generate}"
        }
      end

      def default_params
        {
          compression: 'NONE',
          output: { target: 'S3' },
          outputFormat: 'CSV'
        }
      end

      def handle_response(response)
        raise Zuora::ErrorHandler::APIError, response unless response.code == 200

        response['data']
      end
    end
  end
end
