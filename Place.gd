extends Node2D


onready var visuals = $Visuals


var people = []
var capital = []
var land



# Called when the node enters the scene tree for the first time.
func _ready():
	setup_people(2)
	setup_capital(0)
	
	
	visuals.display_board()
	pass


func setup_people(id):
	match id:
		0:
#			create protection / tribute hierarchal relationship
			create_person("James", "Red", "Male", 30)
			create_person("Sally", "Smith", "Female", 20)
			create_person("John", "Smith", "Male", 20)
			create_person("Todd", "Howard", "Male", 25)
			create_person("Sally", "JoeBob", "Female", 35)
			create_relationship(people[0], people[1], DebtEnum.DebtEnum.PROTECTION, DebtEnum.DebtEnum.TRIBUTE)
			create_relationship(people[0], people[2], DebtEnum.DebtEnum.PROTECTION, DebtEnum.DebtEnum.TRIBUTE)
			create_relationship(people[0], people[3], DebtEnum.DebtEnum.PROTECTION, DebtEnum.DebtEnum.TRIBUTE)
			create_relationship(people[0], people[4], DebtEnum.DebtEnum.PROTECTION, DebtEnum.DebtEnum.TRIBUTE)
			
		1:
#			egalitarian society
			create_person("Adam", "Man", "Male", 20)
			create_person("Eve", "Woman", "Female", 20)
			create_relationship(people[0], people[1], DebtEnum.DebtEnum.FRIEND, DebtEnum.DebtEnum.FRIEND)
		2:
#			solo
			create_person("Adam", "Man", "Male", 20)
	
	
func setup_capital(id):
	match id:
		0:
			var f = Farmland.new()
			add_capital(f)


func create_person(new_first_name, new_last_name, new_sex, new_age):
	var p = Person.new()
	p.init(new_first_name, new_last_name, new_sex, new_age)
	people.append(p)


func add_capital(new_capital):
	capital.append(new_capital)


func create_relationship(p1, p2, p1_debt, p2_debt):
	var r1t2 = Relationship.new()
	r1t2.set_relation(p2, p1_debt)
	p1.add_relationship(r1t2)
	var r2t1 = Relationship.new()
	r2t1.set_relation(p1, p2_debt)
	p2.add_relationship(r2t1)


func pass_hour():
	for p in people:
		p.pass_hour()

func people_pay_debts():
	for p in people:
		p.pay_debts()


func _on_Timer_timeout():
	pass_hour()
	pass

