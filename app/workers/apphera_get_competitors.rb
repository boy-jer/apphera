class AppheraGetCompetitors
  @queue = :search

  def self.perform(org_id)
    org = Organization.find(org_id)
    org.get_apphera_comps
  end
end