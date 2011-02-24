require 'rexml/document'

module Redmine
  module VERSION #:nodoc:
    MAJOR = 1
    MINOR = 1
    PATCH = 0
    TINY  = PATCH # Redmine compat
    
    # Branches:
    # * stable - released version
    # * master - stable development
    # * unstable - future development
    #
    # Source: https://www.chiliproject.org/projects/chiliproject/wiki/ChiliProject_Repository
    BRANCH = 'master'

    def self.revision
      revision = `git rev-parse HEAD`
      if revision.present?
        revision.strip[0..8]
      else
        nil
      end
    end

    REVISION = self.revision
    ARRAY = [MAJOR, MINOR, PATCH, BRANCH, REVISION].compact
    STRING = ARRAY.join('.')
    
    def self.to_a; ARRAY end
    def self.to_s; STRING end    
  end
end
