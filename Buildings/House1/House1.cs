using Godot;
using System;

public partial class House1 : AnimatableBody2D
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		AnimationPlayer player = (AnimationPlayer)GetNode("AnimationPlayer");
		player.Play();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}