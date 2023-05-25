using VanLichAPI.Models.Databases;
using VanLichAPI.Services;

var builder = WebApplication.CreateBuilder(args);
// Add database services to the container.
{
    builder.Services.Configure<VanLichDatabaseSettings>(
            builder.Configuration.GetSection("VanLichDatabase")
        );
    builder.Services.AddSingleton<VanLichDbServices>();
    
}
// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

{
    app.UseHttpsRedirection();

    app.UseAuthorization();

    app.MapControllers();

    app.Run();

}