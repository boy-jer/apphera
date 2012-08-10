class ReviewersController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :set_org

  # GET /reviews
  # GET /reviews.json
  def index

    unless @org
      redirect_to new_account_path, :notice => t(:please_add_location) and return
    end

    # begin
    #       reviews = @org.reviews
    #     rescue
    #     end
    # 
    #     unless reviews.nil?
    #       @reviewers = []
    #       reviews.each do |re|
    #         @reviewers << re.reviewer
    #       end
    @cps = ContentProvider.all.index_by(&:id)
    comps = @org.organizations
    reviewer_ids = comps.map { |o| o.list_of_reviewers }.flatten
    #reviewer_ids = [773, 826, 898, 899, 900, 901, 902, 903, 904, 905, 906, 907, 908, 909, 910, 911, 912, 913, 914, 915, 733, 734, 735, 736, 737, 738, 739, 813, 814, 815, 816, 817, 802, 878, 879, 880, 881, 714, 754, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771, 772, 774, 775, 776, 777, 778, 779, 780, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749, 750, 751, 752, 753, 755, 805, 806, 807, 808, 809, 810, 811, 812, 796, 797, 798, 799, 800, 801, 803, 804, 837, 838, 839, 840, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 859, 860, 862, 863, 864, 865, 866, 867, 868, 869, 870, 871, 872, 873, 874, 875, 876, 877, 756, 716, 882, 883, 884, 885, 886, 887, 888, 889, 890, 891, 892, 893, 894, 895, 896, 897, 757, 758, 759, 760, 761, 818, 819, 820, 821, 822, 823, 824, 825, 827, 828, 829, 830, 831, 832, 833, 834, 835, 836, 787, 9938, 11456, 14332, 38697, 41963, 853, 854, 855, 856, 857, 858, 781, 782, 783, 784, 785, 786, 788, 789, 790, 791, 792, 793, 794, 795]
    @reviewers = Reviewer.find(reviewer_ids)
    #@reviewers = @org.organizations.map { |o| o.reviewers}
    # @reviewers= @reviewers.include(:reviews).sort do |a,b|
    #       a.reviews.size <=> b.review.size
    #     end
    @reviewers = Kaminari.paginate_array(@reviewers).page(params[:page]).per(15)
    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:legend][:align] = "right"
      f.options[:chart][:defaultSeriesType] = "bar"
      f.options[:title][:text] = "Anzahl von Reviews"
      @reviewers.each do |rev|
        f.series(:name => rev.name, :data => [rev.review_count])
      end
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviewers }
    end
  end

  def index2

    unless @org
      redirect_to new_account_path, :notice => t(:please_add_location) and return
    end


    @reviewers = @org.organizations.map { |o| o.reviewers.includes(:reviews) }.flatten

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviewers }
    end
  end

  # GET /reviewer/1
  # GET /reviewer/1.json
  def show
    @cps = ContentProvider.all.index_by(&:id)

    @reviewer = Reviewer.find(params[:id])
    @reviews = @reviewer.reviews.includes(:organization)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json


end
