# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  video_id   :integer
#  reply_id   :integer
#  vote       :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  scope :latest, ->{ order(created_at: :desc) }

  belongs_to :user,foreign_key:'user_id'
  belongs_to :video,foreign_key:'video_id'
  belongs_to :reply,class_name:'User',foreign_key:'reply_id',primary_key:'id'
  before_create :set_vote

  Name =[
    '刀锋意志 艾瑞莉娅','嗜血猎手 沃里克','赏金猎人 厄运晓姐', '英勇投弹手 库奇','复仇焰魂 布兰德','暗影之拳 阿卡丽','天启者 卡尔玛', '盲僧 李青','狂暴之心 凯南','玛西亚之力 盖伦',
    '寒冰射手 艾希','麦林炮手 崔丝塔娜','蛮族之王 泰达米尔','宝石骑士 塔里克','邪恶小法师 维迦','武器大师 贾克斯', '暗夜猎手 薇恩','堕落天使 莫甘娜','虚空先知 玛尔扎哈','时光守护者 基兰',
    '机械公敌 兰博','诅咒巨魔 特朗德尔','炼金术士 辛吉德','策士统领 斯维因 ','魔蛇之拥 卡西奥佩娅','黑暗之女 安妮','皮城女警 凯特琳', '寡妇制造者 伊芙琳','瘟疫之源 图奇',
    '审判天使 凯尔','虚空恐惧 科加斯','狂战士 奥拉夫','殇之木乃伊 阿木木','哨兵之殇 加里奥 ','蒸汽机器人 布里茨', '大发明家 黑默丁格','卡牌大师 崔斯特','熔岩巨兽 墨菲特','沙漠死神 内瑟斯',
    '深渊巨口 克格莫','无极剑圣 易','德邦总管 赵信','狂野女猎手 奈德丽', '牛头酋长 阿利斯塔','披甲龙龟 拉莫斯','首领之傲 厄加特','暮光之眼 慎', '流浪法师 瑞兹','冰晶凤凰 艾尼维亚',
    '不祥之刃 卡特琳娜','野兽之灵 乌迪尔', '亡灵勇士 赛恩','恶魔小丑 萨科','诡术妖姬 乐芙兰','永恒梦魇 魔腾', '猩红收割者 弗拉基米尔','战争女神 希维尔','祖安狂人 蒙多医生','扭曲树精 茂凯',
    '战争之王 潘森','圣锤之毅 波比','光辉女郎 拉克丝','众星之子 索拉卡','琴瑟仙女 娑娜', '探险家 伊泽瑞尔','末日使者 费德提克','荒漠屠夫 雷克顿','酒桶 古拉加斯', '虚空行者 卡萨丁',
    '风暴之怒 迦娜','迅捷斥候 提莫','发条魔灵 奥莉安娜', '德玛西亚皇子 嘉文四世','金属大师 莫德凯撒','雪人骑士 努努','海洋之灾 普朗克','死亡颂唱者 卡尔萨斯'
  ]

  def set_vote
    self.vote = rand(10) + 1
  end

  def self.rand_name
    Comment::Name[rand(Comment::Name.count)]
  end

end
