extends Node


func bombing():
	for c in self.get_children():
		if c.inside == true:
			c.bombed()
